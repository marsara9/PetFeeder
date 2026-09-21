# Firmware Migration Gaps

Compared on 2026-09-21, before replacing the legacy `code/` firmware with the
ESP-IDF firmware in `code2/`. Android will be modernized alongside the
firmware, so this ledger tracks feature parity rather than backward
compatibility.

## Confirmed gaps

### Notifications and device registration

The legacy firmware has a notification service that sends an FCM notification
after every manual or scheduled feeding. It stores registered devices and
exposes:

- `POST /register`
- `DELETE /register/{id}`
- `PUT /settings?fcm_fingerprint=...`

The replacement firmware has no notification service, registration model,
registration endpoints, FCM credential/fingerprint state, or notification
call after feeding. This is a complete feature loss.

The old implementation uses the legacy FCM HTTP endpoint and a hardcoded
authorization key. Restoring the feature should include deciding whether to
replace that deprecated transport rather than copying it unchanged.

### mDNS discovery

The legacy firmware starts an mDNS service after joining the configured Wi-Fi
network. It advertises TCP port 80 as the `petfeeder` service and calls
`MDNS.update()` in the main loop. The Android app relies on this service for
later feeder discovery.

The replacement firmware has no mDNS component or service advertisement. This
breaks the Android NSD discovery path unless the app is changed to use another
address-discovery mechanism.

### Hostname and feeder name

The legacy firmware generates a stable random default name with the
`petfeeder_` prefix, uses it as the access-point SSID, sets it as the station
hostname, and uses it as the mDNS name. A configured `Settings.name` is
persisted and returned by `GET /settings`, and is included in notification
text.

The replacement firmware has only SSID/password credentials. It does not
persist or expose a feeder name, set a station hostname, or derive a hostname
from the device identity.

### Provisioning and API feature coverage

The legacy access point has a generated `petfeeder_<random>` SSID. The
replacement access point always uses `PetFeeder-Setup`. The Android setup flow
will need to be modernized to discover the replacement provisioning flow; this
is not a requirement to preserve the old SSID format.

The legacy `PUT /settings` accepts `ssid`, `password`, `name`, and
`fcm_fingerprint`, preserves omitted settings, and triggers a Wi-Fi update.
The replacement accepts only `ssid` and `password`, requires an SSID, and
does not reconfigure Wi-Fi until reboot. The modern Android settings flow can
adopt a new contract, but it still needs equivalent user-visible settings and
Wi-Fi provisioning capability.

The legacy schedule API creates records with `POST /schedule?cups=...&time=...`
and generates the UUID on the device. The replacement uses
`PUT /schedule/{uuid}?cups=...&time=...`, requires a UUID-shaped client-supplied
ID, and does not register `POST /schedule`. This is an intentional API
redesign for the coordinated Android migration, but schedule creation,
editing, listing, and deletion must remain covered.

### Settings and persistence coverage

The legacy SD datastore persists settings, schedules, feedings, and registered
devices. The replacement persists Wi-Fi credentials, schedules, and feeding
history, but not the legacy name or notification registrations.

The on-card formats are also different. Because backward compatibility is out
of scope, existing legacy cards do not need automatic migration; the new
Android and firmware releases should agree on the replacement format and
fresh-card behavior.

## Behavior changes to verify

These are not necessarily regressions, but they need an explicit compatibility
decision:

- The legacy feeder blocks while dispensing, waits one second between minimum
  portions, records history after dispensing, and sends notifications after
  dispensing. The replacement accepts a feed asynchronously, records history
  before the motor task completes, and rejects a feed while the motor is busy.
- The legacy scheduler selects and schedules the next upcoming schedule. The
  replacement registers all schedules as daily events and executes them from a
  FreeRTOS task. Both use UTC, but the concurrency and duplicate-feed failure
  modes differ.
- The replacement rejects amounts below `0.125` cups. The legacy HTTP check
  allowed zero through its lower-bound test, although zero did not represent a
  useful dispense.
- The replacement requires strict zero-padded `HH:MM` schedule times. The
  legacy parser accepted looser forms such as `8:30`.
- The replacement has bounded history retention (365 days and 1,000 entries).
  The legacy datastore did not apply those bounds.
- The replacement starts an open setup AP with a fixed maximum connection
  count. The legacy AP was also open, but used the generated feeder name and
  was managed alongside station mode differently.
- The replacement currently starts a UART echo loop in `app_main`; this is
  development behavior rather than a legacy feeder feature and should be
  removed or intentionally retained before release.

## Present in both implementations

- ESP32/HUZZAH-oriented motor control and TB6612 stepper dispensing.
- SD-card-backed storage for schedules and feeding history.
- HTTP settings, feeding-history, and schedule operations on port 80.
- NTP/SNTP time synchronization and UTC schedule execution.
- Wi-Fi station connection with fallback to a provisioning access point.

## Recommended parity work after the tree swap

1. Restore mDNS with the service name and port expected by Android, plus the
   hostname/default-name behavior.
2. Define the new settings and provisioning contract with the Android app.
3. Decide whether to restore notifications using a supported FCM transport;
   then restore registration persistence and endpoints.
4. Ensure the redesigned schedule API covers the complete Android workflow.
5. Define the replacement SD-card format and fresh-card initialization.
6. Test motor failure/history ordering and remove the UART echo loop before
   treating the migration as feature-complete.

## Historical verification

The legacy git history contains dedicated feature commits for mDNS, FCM
notifications, schedule creation, feeding history, and Android discovery.
The old `code/` directory is therefore retained in git history even after the
working-tree replacement, so any unresolved item above can be rechecked with
`git show` or by checking out the relevant commit.
