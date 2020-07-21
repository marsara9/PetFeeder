<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.6.2">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="14" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="13" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="14" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="13" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="11" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="50" name="dxf" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="53" name="tGND_GNDA" color="7" fill="9" visible="no" active="no"/>
<layer number="54" name="bGND_GNDA" color="1" fill="9" visible="no" active="no"/>
<layer number="56" name="wert" color="7" fill="1" visible="no" active="no"/>
<layer number="57" name="tCAD" color="7" fill="1" visible="no" active="no"/>
<layer number="59" name="tCarbon" color="7" fill="1" visible="no" active="no"/>
<layer number="60" name="bCarbon" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="99" name="SpiceOrder" color="7" fill="1" visible="no" active="no"/>
<layer number="100" name="Muster" color="7" fill="1" visible="yes" active="yes"/>
<layer number="101" name="Patch_Top" color="12" fill="4" visible="yes" active="yes"/>
<layer number="102" name="Mittellin" color="7" fill="1" visible="yes" active="yes"/>
<layer number="103" name="Stiffner" color="7" fill="1" visible="yes" active="yes"/>
<layer number="104" name="Name" color="7" fill="1" visible="yes" active="yes"/>
<layer number="105" name="Beschreib" color="7" fill="1" visible="yes" active="yes"/>
<layer number="106" name="BGA-Top" color="7" fill="1" visible="yes" active="yes"/>
<layer number="107" name="BD-Top" color="7" fill="1" visible="yes" active="yes"/>
<layer number="108" name="tBridges" color="7" fill="1" visible="yes" active="yes"/>
<layer number="109" name="tBPL" color="7" fill="1" visible="yes" active="yes"/>
<layer number="110" name="bBPL" color="7" fill="1" visible="yes" active="yes"/>
<layer number="111" name="MPL" color="7" fill="1" visible="yes" active="yes"/>
<layer number="112" name="tSilk" color="7" fill="1" visible="yes" active="yes"/>
<layer number="113" name="ReferenceLS" color="7" fill="1" visible="no" active="no"/>
<layer number="114" name="tPlaceRed" color="7" fill="1" visible="yes" active="yes"/>
<layer number="115" name="FRNTMAAT2" color="7" fill="1" visible="yes" active="yes"/>
<layer number="116" name="Patch_BOT" color="9" fill="4" visible="yes" active="yes"/>
<layer number="117" name="BACKMAAT1" color="7" fill="1" visible="yes" active="yes"/>
<layer number="118" name="Rect_Pads" color="7" fill="1" visible="no" active="no"/>
<layer number="119" name="KAP_TEKEN" color="7" fill="1" visible="yes" active="yes"/>
<layer number="120" name="KAP_MAAT1" color="7" fill="1" visible="yes" active="yes"/>
<layer number="121" name="sName" color="7" fill="1" visible="yes" active="yes"/>
<layer number="122" name="_bPlace" color="7" fill="1" visible="yes" active="yes"/>
<layer number="123" name="tTestmark" color="7" fill="1" visible="no" active="yes"/>
<layer number="124" name="bTestmark" color="7" fill="1" visible="no" active="yes"/>
<layer number="125" name="_tNames" color="7" fill="1" visible="yes" active="yes"/>
<layer number="126" name="_bNames" color="7" fill="1" visible="yes" active="yes"/>
<layer number="127" name="_tValues" color="7" fill="1" visible="yes" active="yes"/>
<layer number="128" name="_bValues" color="7" fill="1" visible="yes" active="yes"/>
<layer number="129" name="Mask" color="7" fill="1" visible="yes" active="yes"/>
<layer number="130" name="SMDSTROOK" color="7" fill="1" visible="yes" active="yes"/>
<layer number="131" name="tAdjust" color="7" fill="1" visible="no" active="yes"/>
<layer number="132" name="bAdjust" color="7" fill="1" visible="no" active="yes"/>
<layer number="133" name="bottom_silk" color="7" fill="1" visible="yes" active="yes"/>
<layer number="144" name="Drill_legend" color="7" fill="1" visible="yes" active="yes"/>
<layer number="150" name="Notes" color="7" fill="1" visible="yes" active="yes"/>
<layer number="151" name="HeatSink" color="7" fill="1" visible="yes" active="yes"/>
<layer number="152" name="_bDocu" color="7" fill="1" visible="yes" active="yes"/>
<layer number="153" name="FabDoc1" color="6" fill="1" visible="no" active="no"/>
<layer number="154" name="FabDoc2" color="2" fill="1" visible="no" active="no"/>
<layer number="155" name="FabDoc3" color="7" fill="15" visible="no" active="no"/>
<layer number="199" name="Contour" color="7" fill="1" visible="yes" active="yes"/>
<layer number="200" name="200bmp" color="1" fill="10" visible="yes" active="yes"/>
<layer number="201" name="201bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="202" name="202bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="203" name="203bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="204" name="204bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="205" name="205bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="206" name="206bmp" color="7" fill="10" visible="yes" active="yes"/>
<layer number="207" name="207bmp" color="8" fill="10" visible="yes" active="yes"/>
<layer number="208" name="208bmp" color="9" fill="10" visible="yes" active="yes"/>
<layer number="209" name="209bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="210" name="210bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="211" name="211bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="212" name="212bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="213" name="213bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="214" name="214bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="215" name="215bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="216" name="216bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="217" name="217bmp" color="18" fill="1" visible="no" active="no"/>
<layer number="218" name="218bmp" color="19" fill="1" visible="no" active="no"/>
<layer number="219" name="219bmp" color="20" fill="1" visible="no" active="no"/>
<layer number="220" name="220bmp" color="21" fill="1" visible="no" active="no"/>
<layer number="221" name="221bmp" color="22" fill="1" visible="no" active="no"/>
<layer number="222" name="222bmp" color="23" fill="1" visible="no" active="no"/>
<layer number="223" name="223bmp" color="24" fill="1" visible="no" active="no"/>
<layer number="224" name="224bmp" color="25" fill="1" visible="no" active="no"/>
<layer number="225" name="225bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="226" name="226bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="227" name="227bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="228" name="228bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="229" name="229bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="230" name="230bmp" color="7" fill="1" visible="yes" active="yes"/>
<layer number="231" name="Eagle3D_PG1" color="7" fill="1" visible="no" active="no"/>
<layer number="232" name="Eagle3D_PG2" color="7" fill="1" visible="no" active="no"/>
<layer number="233" name="Eagle3D_PG3" color="7" fill="1" visible="no" active="no"/>
<layer number="248" name="Housing" color="7" fill="1" visible="yes" active="yes"/>
<layer number="249" name="Edge" color="7" fill="1" visible="yes" active="yes"/>
<layer number="250" name="Descript" color="7" fill="1" visible="yes" active="yes"/>
<layer number="251" name="SMDround" color="7" fill="1" visible="yes" active="yes"/>
<layer number="254" name="cooling" color="7" fill="1" visible="yes" active="yes"/>
<layer number="255" name="routoute" color="7" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="microbuilder">
<description>&lt;h2&gt;&lt;b&gt;microBuilder.eu&lt;/b&gt; Eagle Footprint Library&lt;/h2&gt;

&lt;p&gt;Footprints for common components used in our projects and products.  This is the same library that we use internally, and it is regularly updated.  The newest version can always be found at &lt;b&gt;www.microBuilder.eu&lt;/b&gt;.  If you find this library useful, please feel free to purchase something from our online store. Please also note that all holes are optimised for metric drill bits!&lt;/p&gt;

&lt;h3&gt;Obligatory Warning&lt;/h3&gt;
&lt;p&gt;While it probably goes without saying, there are no guarantees that the footprints or schematic symbols in this library are flawless, and we make no promises of fitness for production, prototyping or any other purpose. These libraries are provided for information puposes only, and are used at your own discretion.  While we make every effort to produce accurate footprints, and many of the items found in this library have be proven in production, we can't make any promises of suitability for a specific purpose. If you do find any errors, though, please feel free to contact us at www.microbuilder.eu to let us know about it so that we can update the library accordingly!&lt;/p&gt;

&lt;h3&gt;License&lt;/h3&gt;
&lt;p&gt;This work is placed in the public domain, and may be freely used for commercial and non-commercial work with the following conditions:&lt;/p&gt;
&lt;p&gt;THIS SOFTWARE IS PROVIDED ''AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE INSTITUTE OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
&lt;/p&gt;</description>
<packages>
<package name="0603-MINI">
<description>0603-Mini
&lt;p&gt;Mini footprint for dense boards&lt;/p&gt;</description>
<wire x1="-1.346" y1="0.583" x2="1.346" y2="0.583" width="0.0508" layer="39"/>
<wire x1="1.346" y1="0.583" x2="1.346" y2="-0.583" width="0.0508" layer="39"/>
<wire x1="1.346" y1="-0.583" x2="-1.346" y2="-0.583" width="0.0508" layer="39"/>
<wire x1="-1.346" y1="-0.583" x2="-1.346" y2="0.583" width="0.0508" layer="39"/>
<wire x1="-1.45" y1="-0.7" x2="-1.45" y2="0.7" width="0.2032" layer="21"/>
<wire x1="-1.45" y1="0.7" x2="1.45" y2="0.7" width="0.2032" layer="21"/>
<wire x1="1.45" y1="0.7" x2="1.45" y2="-0.7" width="0.2032" layer="21"/>
<wire x1="1.45" y1="-0.7" x2="-1.45" y2="-0.7" width="0.2032" layer="21"/>
<wire x1="-0.356" y1="0.432" x2="0.356" y2="0.432" width="0.1016" layer="51"/>
<wire x1="-0.356" y1="-0.419" x2="0.356" y2="-0.419" width="0.1016" layer="51"/>
<smd name="1" x="-0.75" y="0" dx="0.9" dy="0.9" layer="1"/>
<smd name="2" x="0.75" y="0" dx="0.9" dy="0.9" layer="1"/>
<text x="1.524" y="-0.0635" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="1.524" y="-0.635" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-0.8382" y1="-0.4699" x2="-0.3381" y2="0.4801" layer="51"/>
<rectangle x1="0.3302" y1="-0.4699" x2="0.8303" y2="0.4801" layer="51"/>
</package>
<package name="2012">
<wire x1="-1.662" y1="1.245" x2="1.662" y2="1.245" width="0.2032" layer="51"/>
<wire x1="-1.637" y1="-1.245" x2="1.687" y2="-1.245" width="0.2032" layer="51"/>
<wire x1="-3.473" y1="1.483" x2="3.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="3.473" y1="1.483" x2="3.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="3.473" y1="-1.483" x2="-3.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-3.473" y1="-1.483" x2="-3.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="-3.302" y1="1.524" x2="3.302" y2="1.524" width="0.2032" layer="21"/>
<wire x1="3.302" y1="1.524" x2="3.302" y2="-1.524" width="0.2032" layer="21"/>
<wire x1="3.302" y1="-1.524" x2="-3.302" y2="-1.524" width="0.2032" layer="21"/>
<wire x1="-3.302" y1="-1.524" x2="-3.302" y2="1.524" width="0.2032" layer="21"/>
<smd name="1" x="-2.2" y="0" dx="1.8" dy="2.7" layer="1"/>
<smd name="2" x="2.2" y="0" dx="1.8" dy="2.7" layer="1"/>
<text x="-2.54" y="1.8415" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-2.667" y="-2.159" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-2.4892" y1="-1.3208" x2="-1.6393" y2="1.3292" layer="51"/>
<rectangle x1="1.651" y1="-1.3208" x2="2.5009" y2="1.3292" layer="51"/>
</package>
<package name="0805_NOTHERMALS">
<wire x1="-1.873" y1="0.883" x2="1.873" y2="0.883" width="0.0508" layer="39"/>
<wire x1="1.873" y1="-0.883" x2="-1.873" y2="-0.883" width="0.0508" layer="39"/>
<wire x1="-1.873" y1="-0.883" x2="-1.873" y2="0.883" width="0.0508" layer="39"/>
<wire x1="-0.381" y1="0.66" x2="0.381" y2="0.66" width="0.1016" layer="51"/>
<wire x1="-0.356" y1="-0.66" x2="0.381" y2="-0.66" width="0.1016" layer="51"/>
<wire x1="1.873" y1="0.883" x2="1.873" y2="-0.883" width="0.0508" layer="39"/>
<wire x1="1.85" y1="1" x2="1.85" y2="-1" width="0.2032" layer="21"/>
<wire x1="1.85" y1="-1" x2="-1.85" y2="-1" width="0.2032" layer="21"/>
<wire x1="-1.85" y1="-1" x2="-1.85" y2="1" width="0.2032" layer="21"/>
<wire x1="-1.85" y1="1" x2="1.85" y2="1" width="0.2032" layer="21"/>
<smd name="1" x="-0.95" y="0" dx="1.3" dy="1.5" layer="1" thermals="no"/>
<smd name="2" x="0.95" y="0" dx="1.3" dy="1.5" layer="1" thermals="no"/>
<text x="2.032" y="-0.127" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="2.032" y="-0.762" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-1.0922" y1="-0.7239" x2="-0.3421" y2="0.7262" layer="51"/>
<rectangle x1="0.3556" y1="-0.7239" x2="1.1057" y2="0.7262" layer="51"/>
</package>
<package name="2512">
<description>&lt;b&gt;RESISTOR 2512 (Metric 6432)&lt;/b&gt;</description>
<wire x1="-2.362" y1="1.473" x2="2.387" y2="1.473" width="0.2032" layer="51"/>
<wire x1="-2.362" y1="-1.473" x2="2.387" y2="-1.473" width="0.2032" layer="51"/>
<wire x1="-3.973" y1="1.983" x2="3.973" y2="1.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="1.983" x2="3.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="-1.983" x2="-3.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="-3.973" y1="-1.983" x2="-3.973" y2="1.983" width="0.0508" layer="39"/>
<smd name="1" x="-2.8" y="0" dx="1.8" dy="3.2" layer="1"/>
<smd name="2" x="2.8" y="0" dx="1.8" dy="3.2" layer="1"/>
<text x="-3.683" y="1.905" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-3.556" y="-2.286" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-3.2004" y1="-1.5494" x2="-2.3505" y2="1.5507" layer="51"/>
<rectangle x1="2.3622" y1="-1.5494" x2="3.2121" y2="1.5507" layer="51"/>
<rectangle x1="-0.5001" y1="-1" x2="0.5001" y2="1" layer="35"/>
</package>
<package name="_0402">
<description>&lt;b&gt; 0402&lt;/b&gt;</description>
<wire x1="-0.245" y1="0.174" x2="0.245" y2="0.174" width="0.1016" layer="51"/>
<wire x1="0.245" y1="-0.174" x2="-0.245" y2="-0.174" width="0.1016" layer="51"/>
<wire x1="-1.0573" y1="0.5557" x2="1.0573" y2="0.5557" width="0.2032" layer="21"/>
<wire x1="1.0573" y1="0.5557" x2="1.0573" y2="-0.5556" width="0.2032" layer="21"/>
<wire x1="1.0573" y1="-0.5556" x2="-1.0573" y2="-0.5557" width="0.2032" layer="21"/>
<wire x1="-1.0573" y1="-0.5557" x2="-1.0573" y2="0.5557" width="0.2032" layer="21"/>
<smd name="1" x="-0.508" y="0" dx="0.6" dy="0.6" layer="1"/>
<smd name="2" x="0.508" y="0" dx="0.6" dy="0.6" layer="1"/>
<text x="-0.9525" y="0.7939" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-0.9525" y="-1.3336" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-0.0794" y1="-0.2381" x2="0.0794" y2="0.2381" layer="35"/>
<rectangle x1="0.25" y1="-0.25" x2="0.5" y2="0.25" layer="51"/>
<rectangle x1="-0.5" y1="-0.25" x2="-0.25" y2="0.25" layer="51"/>
</package>
<package name="_0402MP">
<description>&lt;b&gt;0402 MicroPitch&lt;p&gt;</description>
<wire x1="-0.245" y1="0.174" x2="0.245" y2="0.174" width="0.1016" layer="51"/>
<wire x1="0.245" y1="-0.174" x2="-0.245" y2="-0.174" width="0.1016" layer="51"/>
<wire x1="0" y1="0.127" x2="0" y2="-0.127" width="0.2032" layer="21"/>
<smd name="1" x="-0.508" y="0" dx="0.5" dy="0.5" layer="1"/>
<smd name="2" x="0.508" y="0" dx="0.5" dy="0.5" layer="1"/>
<text x="-0.635" y="0.4763" size="0.6096" layer="25" ratio="18">&gt;NAME</text>
<text x="-0.635" y="-0.7938" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-0.1" y1="-0.2" x2="0.1" y2="0.2" layer="35"/>
<rectangle x1="-0.5" y1="-0.25" x2="-0.254" y2="0.25" layer="51"/>
<rectangle x1="0.2588" y1="-0.25" x2="0.5" y2="0.25" layer="51"/>
</package>
<package name="_0603">
<description>&lt;b&gt;0603&lt;/b&gt;</description>
<wire x1="-0.432" y1="-0.306" x2="0.432" y2="-0.306" width="0.1016" layer="51"/>
<wire x1="0.432" y1="0.306" x2="-0.432" y2="0.306" width="0.1016" layer="51"/>
<wire x1="-1.4605" y1="0.635" x2="1.4605" y2="0.635" width="0.2032" layer="21"/>
<wire x1="1.4605" y1="0.635" x2="1.4605" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="1.4605" y1="-0.635" x2="-1.4605" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="-1.4605" y1="-0.635" x2="-1.4605" y2="0.635" width="0.2032" layer="21"/>
<smd name="1" x="-0.762" y="0" dx="0.9" dy="0.8" layer="1"/>
<smd name="2" x="0.762" y="0" dx="0.9" dy="0.8" layer="1"/>
<text x="-1.27" y="0.9525" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-1.27" y="-1.4923" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="0.4318" y1="-0.4" x2="0.8382" y2="0.4" layer="51"/>
<rectangle x1="-0.8382" y1="-0.4" x2="-0.4318" y2="0.4" layer="51"/>
<rectangle x1="-0.1999" y1="-0.4001" x2="0.1999" y2="0.4001" layer="35"/>
</package>
<package name="_0603MP">
<description>&lt;b&gt;0603 MicroPitch&lt;/b&gt;</description>
<wire x1="-0.432" y1="-0.306" x2="0.432" y2="-0.306" width="0.1016" layer="51"/>
<wire x1="0.432" y1="0.306" x2="-0.432" y2="0.306" width="0.1016" layer="51"/>
<wire x1="0" y1="0.254" x2="0" y2="-0.254" width="0.2032" layer="21"/>
<smd name="1" x="-0.762" y="0" dx="0.8" dy="0.8" layer="1"/>
<smd name="2" x="0.762" y="0" dx="0.8" dy="0.8" layer="1"/>
<text x="-0.9525" y="0.635" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-0.9525" y="-0.9525" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="0.4318" y1="-0.4" x2="0.8" y2="0.4" layer="51"/>
<rectangle x1="-0.8" y1="-0.4" x2="-0.4318" y2="0.4" layer="51"/>
<rectangle x1="-0.1999" y1="-0.25" x2="0.1999" y2="0.25" layer="35"/>
</package>
<package name="_0805">
<description>&lt;b&gt;0805&lt;/b&gt;</description>
<wire x1="-0.41" y1="0.585" x2="0.41" y2="0.585" width="0.1016" layer="51"/>
<wire x1="-0.41" y1="-0.585" x2="0.41" y2="-0.585" width="0.1016" layer="51"/>
<wire x1="-1.905" y1="0.889" x2="1.905" y2="0.889" width="0.2032" layer="21"/>
<wire x1="1.905" y1="0.889" x2="1.905" y2="-0.889" width="0.2032" layer="21"/>
<wire x1="1.905" y1="-0.889" x2="-1.905" y2="-0.889" width="0.2032" layer="21"/>
<wire x1="-1.905" y1="-0.889" x2="-1.905" y2="0.889" width="0.2032" layer="21"/>
<smd name="1" x="-1.016" y="0" dx="1.2" dy="1.3" layer="1"/>
<smd name="2" x="1.016" y="0" dx="1.2" dy="1.3" layer="1"/>
<text x="-1.5875" y="1.27" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-1.5874" y="-1.651" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="0.4064" y1="-0.65" x2="1.0564" y2="0.65" layer="51"/>
<rectangle x1="-1.0668" y1="-0.65" x2="-0.4168" y2="0.65" layer="51"/>
<rectangle x1="-0.1999" y1="-0.5001" x2="0.1999" y2="0.5001" layer="35"/>
</package>
<package name="_0805MP">
<description>&lt;b&gt;0805 MicroPitch&lt;/b&gt;</description>
<wire x1="-0.51" y1="0.535" x2="0.51" y2="0.535" width="0.1016" layer="51"/>
<wire x1="-0.51" y1="-0.535" x2="0.51" y2="-0.535" width="0.1016" layer="51"/>
<wire x1="0" y1="0.508" x2="0" y2="-0.508" width="0.2032" layer="21"/>
<smd name="1" x="-1.016" y="0" dx="1.2" dy="1.3" layer="1"/>
<smd name="2" x="1.016" y="0" dx="1.2" dy="1.3" layer="1"/>
<text x="-1.5875" y="0.9525" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-1.5875" y="-1.27" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="0.4064" y1="-0.65" x2="1" y2="0.65" layer="51"/>
<rectangle x1="-1" y1="-0.65" x2="-0.4168" y2="0.65" layer="51"/>
<rectangle x1="-0.1999" y1="-0.5001" x2="0.1999" y2="0.5001" layer="35"/>
</package>
<package name="0805-NO">
<wire x1="-0.381" y1="0.66" x2="0.381" y2="0.66" width="0.1016" layer="51"/>
<wire x1="-0.356" y1="-0.66" x2="0.381" y2="-0.66" width="0.1016" layer="51"/>
<smd name="1" x="-0.95" y="0" dx="1.3" dy="1.5" layer="1"/>
<smd name="2" x="0.95" y="0" dx="1.3" dy="1.5" layer="1"/>
<text x="2.032" y="-0.127" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="2.032" y="-0.762" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-1.0922" y1="-0.7239" x2="-0.3421" y2="0.7262" layer="51"/>
<rectangle x1="0.3556" y1="-0.7239" x2="1.1057" y2="0.7262" layer="51"/>
<wire x1="0" y1="0.508" x2="0" y2="-0.508" width="0.3048" layer="21"/>
</package>
<package name="0603-NO">
<wire x1="-1.473" y1="0.729" x2="1.473" y2="0.729" width="0.0508" layer="39"/>
<wire x1="1.473" y1="0.729" x2="1.473" y2="-0.729" width="0.0508" layer="39"/>
<wire x1="1.473" y1="-0.729" x2="-1.473" y2="-0.729" width="0.0508" layer="39"/>
<wire x1="-1.473" y1="-0.729" x2="-1.473" y2="0.729" width="0.0508" layer="39"/>
<wire x1="-0.356" y1="0.432" x2="0.356" y2="0.432" width="0.1016" layer="51"/>
<wire x1="-0.356" y1="-0.419" x2="0.356" y2="-0.419" width="0.1016" layer="51"/>
<smd name="1" x="-0.85" y="0" dx="1.1" dy="1" layer="1"/>
<smd name="2" x="0.85" y="0" dx="1.1" dy="1" layer="1"/>
<text x="1.778" y="-0.127" size="0.8128" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="1.778" y="-0.762" size="0.4064" layer="27" font="vector" ratio="10">&gt;VALUE</text>
<rectangle x1="-0.8382" y1="-0.4699" x2="-0.3381" y2="0.4801" layer="51"/>
<rectangle x1="0.3302" y1="-0.4699" x2="0.8303" y2="0.4801" layer="51"/>
<rectangle x1="-0.1999" y1="-0.3" x2="0.1999" y2="0.3" layer="35"/>
</package>
<package name="_1206">
<wire x1="0.9525" y1="-0.8128" x2="-0.9652" y2="-0.8128" width="0.1016" layer="51"/>
<wire x1="0.9525" y1="0.8128" x2="-0.9652" y2="0.8128" width="0.1016" layer="51"/>
<wire x1="-2.286" y1="1.143" x2="2.286" y2="1.143" width="0.2032" layer="21"/>
<wire x1="2.286" y1="1.143" x2="2.286" y2="-1.143" width="0.2032" layer="21"/>
<wire x1="2.286" y1="-1.143" x2="-2.286" y2="-1.143" width="0.2032" layer="21"/>
<wire x1="-2.286" y1="-1.143" x2="-2.286" y2="1.143" width="0.2032" layer="21"/>
<smd name="2" x="1.27" y="0" dx="1.4" dy="1.8" layer="1"/>
<smd name="1" x="-1.27" y="0" dx="1.4" dy="1.8" layer="1"/>
<rectangle x1="-1.6891" y1="-0.8763" x2="-0.9525" y2="0.8763" layer="51"/>
<rectangle x1="0.9525" y1="-0.8763" x2="1.6891" y2="0.8763" layer="51"/>
<rectangle x1="-0.3" y1="-0.7" x2="0.3" y2="0.7" layer="35"/>
<text x="-2.2225" y="1.5113" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-2.2225" y="-1.8288" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="_1206MP">
<wire x1="1.0525" y1="-0.7128" x2="-1.0652" y2="-0.7128" width="0.1016" layer="51"/>
<wire x1="1.0525" y1="0.7128" x2="-1.0652" y2="0.7128" width="0.1016" layer="51"/>
<wire x1="-0.635" y1="0.635" x2="0.635" y2="0.635" width="0.2032" layer="21"/>
<wire x1="-0.635" y1="-0.635" x2="0.635" y2="-0.635" width="0.2032" layer="21"/>
<smd name="2" x="1.524" y="0" dx="1.3" dy="1.6" layer="1"/>
<smd name="1" x="-1.524" y="0" dx="1.3" dy="1.6" layer="1"/>
<text x="-2.2225" y="1.1113" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-2.2225" y="-1.4288" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-1.6" y1="-0.8" x2="-0.9" y2="0.8" layer="51"/>
<rectangle x1="-0.3" y1="-0.7" x2="0.3" y2="0.7" layer="35"/>
<rectangle x1="0.9001" y1="-0.8" x2="1.6" y2="0.8" layer="51" rot="R180"/>
</package>
<package name="0805_10MGAP">
<wire x1="-0.381" y1="0.66" x2="0.381" y2="0.66" width="0.1016" layer="51"/>
<wire x1="-0.356" y1="-0.66" x2="0.381" y2="-0.66" width="0.1016" layer="51"/>
<smd name="1" x="-1.05" y="0" dx="1.2" dy="1.5" layer="1"/>
<smd name="2" x="1.05" y="0" dx="1.2" dy="1.5" layer="1"/>
<text x="2.032" y="-0.127" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="2.032" y="-0.762" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-1.0922" y1="-0.7239" x2="-0.3421" y2="0.7262" layer="51"/>
<rectangle x1="0.3556" y1="-0.7239" x2="1.1057" y2="0.7262" layer="51"/>
<wire x1="0" y1="0.508" x2="0" y2="-0.508" width="0.3048" layer="21"/>
</package>
<package name="ESP-12S">
<wire x1="-8" y1="14.8" x2="8" y2="14.8" width="0.127" layer="21"/>
<wire x1="8" y1="14.8" x2="8" y2="8.7" width="0.127" layer="21"/>
<wire x1="8" y1="8.7" x2="8" y2="-9.2" width="0.127" layer="21"/>
<wire x1="8" y1="-9.2" x2="-8" y2="-9.2" width="0.127" layer="21"/>
<wire x1="-8" y1="-9.2" x2="-8" y2="8.7" width="0.127" layer="21"/>
<wire x1="-8" y1="8.7" x2="-8" y2="14.8" width="0.127" layer="21"/>
<wire x1="-6" y1="7.17" x2="6" y2="7.17" width="0.127" layer="21"/>
<wire x1="6" y1="7.17" x2="6" y2="-8.13" width="0.127" layer="21"/>
<wire x1="6" y1="-8.13" x2="-6" y2="-8.13" width="0.127" layer="21"/>
<wire x1="-6" y1="-8.13" x2="-6" y2="7.17" width="0.127" layer="21"/>
<text x="-0.2" y="12.47" size="1.27" layer="21" font="vector" ratio="12" align="center">Antenna</text>
<smd name="1" x="-7.65" y="5.77" dx="1.7" dy="1.1" layer="1"/>
<smd name="2" x="-7.65" y="3.77" dx="1.7" dy="1.1" layer="1"/>
<smd name="3" x="-7.65" y="1.77" dx="1.7" dy="1.1" layer="1"/>
<smd name="4" x="-7.65" y="-0.23" dx="1.7" dy="1.1" layer="1"/>
<smd name="5" x="-7.65" y="-2.23" dx="1.7" dy="1.1" layer="1"/>
<smd name="6" x="-7.65" y="-4.23" dx="1.7" dy="1.1" layer="1"/>
<smd name="7" x="-7.65" y="-6.23" dx="1.7" dy="1.1" layer="1"/>
<smd name="8" x="-7.65" y="-8.23" dx="1.7" dy="1.1" layer="1"/>
<smd name="9" x="7.65" y="-8.23" dx="1.7" dy="1.1" layer="1"/>
<smd name="10" x="7.65" y="-6.23" dx="1.7" dy="1.1" layer="1"/>
<smd name="11" x="7.65" y="-4.23" dx="1.7" dy="1.1" layer="1"/>
<smd name="12" x="7.65" y="-2.23" dx="1.7" dy="1.1" layer="1"/>
<smd name="13" x="7.65" y="-0.23" dx="1.7" dy="1.1" layer="1"/>
<smd name="14" x="7.65" y="1.77" dx="1.7" dy="1.1" layer="1"/>
<smd name="15" x="7.65" y="3.77" dx="1.7" dy="1.1" layer="1"/>
<smd name="16" x="7.65" y="5.77" dx="1.7" dy="1.1" layer="1"/>
<smd name="P$1" x="0.2" y="1.1" dx="3.2" dy="3.2" layer="1" cream="no"/>
<rectangle x1="-1.016" y1="1.27" x2="0" y2="2.286" layer="31"/>
<rectangle x1="0.508" y1="1.27" x2="1.524" y2="2.286" layer="31"/>
<rectangle x1="0.508" y1="-0.254" x2="1.524" y2="0.762" layer="31"/>
<rectangle x1="-1.016" y1="-0.254" x2="0" y2="0.762" layer="31"/>
<wire x1="-8" y1="8.7" x2="8" y2="8.7" width="0.127" layer="21"/>
</package>
<package name="QFN24_4MM_SMSC">
<wire x1="1.65" y1="-2" x2="2" y2="-2" width="0.2032" layer="21"/>
<wire x1="2" y1="-1.65" x2="2" y2="-2" width="0.2032" layer="21"/>
<wire x1="-1.65" y1="-2" x2="-2" y2="-2" width="0.2032" layer="21"/>
<wire x1="-2" y1="-2" x2="-2" y2="-1.65" width="0.2032" layer="21"/>
<wire x1="2" y1="1.65" x2="2" y2="2" width="0.2032" layer="21"/>
<wire x1="2" y1="2" x2="1.65" y2="2" width="0.2032" layer="21"/>
<wire x1="-1.65" y1="2" x2="-2" y2="1.65" width="0.2032" layer="21"/>
<wire x1="-2" y1="2" x2="-2" y2="-2" width="0.2032" layer="51"/>
<wire x1="-2" y1="-2" x2="2" y2="-2" width="0.2032" layer="51"/>
<wire x1="2" y1="-2" x2="2" y2="2" width="0.2032" layer="51"/>
<wire x1="2" y1="2" x2="-2" y2="2" width="0.2032" layer="51"/>
<circle x="-2.0828" y="2.0828" radius="0.127" width="0.2032" layer="21"/>
<smd name="1" x="-2" y="1.25" dx="0.8" dy="0.28" layer="1" roundness="50" rot="R180"/>
<smd name="2" x="-2" y="0.75" dx="0.8" dy="0.28" layer="1" roundness="50" rot="R180"/>
<smd name="3" x="-2" y="0.25" dx="0.8" dy="0.28" layer="1" roundness="50" rot="R180"/>
<smd name="4" x="-2" y="-0.25" dx="0.8" dy="0.28" layer="1" roundness="50" rot="R180"/>
<smd name="5" x="-2" y="-0.75" dx="0.8" dy="0.28" layer="1" roundness="50" rot="R180"/>
<smd name="6" x="-2" y="-1.25" dx="0.8" dy="0.28" layer="1" roundness="50" rot="R180"/>
<smd name="7" x="-1.25" y="-2" dx="0.8" dy="0.28" layer="1" roundness="50" rot="R90"/>
<smd name="8" x="-0.75" y="-2" dx="0.8" dy="0.28" layer="1" roundness="50" rot="R90"/>
<smd name="9" x="-0.25" y="-2" dx="0.8" dy="0.28" layer="1" roundness="50" rot="R90"/>
<smd name="10" x="0.25" y="-2" dx="0.8" dy="0.28" layer="1" roundness="50" rot="R90"/>
<smd name="11" x="0.75" y="-2" dx="0.8" dy="0.28" layer="1" roundness="50" rot="R90"/>
<smd name="12" x="1.25" y="-2" dx="0.8" dy="0.28" layer="1" roundness="50" rot="R90"/>
<smd name="13" x="2" y="-1.25" dx="0.8" dy="0.28" layer="1" roundness="50"/>
<smd name="14" x="2" y="-0.75" dx="0.8" dy="0.28" layer="1" roundness="50"/>
<smd name="15" x="2" y="-0.25" dx="0.8" dy="0.28" layer="1" roundness="50"/>
<smd name="16" x="2" y="0.25" dx="0.8" dy="0.28" layer="1" roundness="50"/>
<smd name="17" x="2" y="0.75" dx="0.8" dy="0.28" layer="1" roundness="50"/>
<smd name="18" x="2" y="1.25" dx="0.8" dy="0.28" layer="1" roundness="50"/>
<smd name="19" x="1.25" y="2" dx="0.8" dy="0.28" layer="1" roundness="50" rot="R270"/>
<smd name="20" x="0.75" y="2" dx="0.8" dy="0.28" layer="1" roundness="50" rot="R270"/>
<smd name="21" x="0.25" y="2" dx="0.8" dy="0.28" layer="1" roundness="50" rot="R270"/>
<smd name="22" x="-0.25" y="2" dx="0.8" dy="0.28" layer="1" roundness="50" rot="R270"/>
<smd name="23" x="-0.75" y="2" dx="0.8" dy="0.28" layer="1" roundness="50" rot="R270"/>
<smd name="24" x="-1.25" y="2" dx="0.8" dy="0.28" layer="1" roundness="50" rot="R270"/>
<smd name="THERM" x="0" y="0" dx="2.5" dy="2.5" layer="1" cream="no"/>
<text x="-2.45" y="2.8" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-2.5" y="-3.15" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-1.2" y1="-1.2" x2="-0.6" y2="-0.6" layer="31"/>
<rectangle x1="-0.3" y1="-0.3" x2="0.3" y2="0.3" layer="31"/>
<rectangle x1="-1.2" y1="-0.3" x2="-0.6" y2="0.3" layer="31"/>
<rectangle x1="-1.2" y1="0.6" x2="-0.6" y2="1.2" layer="31"/>
<rectangle x1="0.6" y1="0.6" x2="1.2" y2="1.2" layer="31"/>
<rectangle x1="0.6" y1="-1.2" x2="1.2" y2="-0.6" layer="31"/>
<rectangle x1="0.6" y1="-0.3" x2="1.2" y2="0.3" layer="31"/>
<rectangle x1="-0.3" y1="0.6" x2="0.3" y2="1.2" layer="31"/>
<rectangle x1="-0.3" y1="-1.2" x2="0.3" y2="-0.6" layer="31"/>
</package>
<package name="EVQ-Q2">
<wire x1="-3.3" y1="3" x2="3.3" y2="3" width="0.2032" layer="21"/>
<wire x1="3.3" y1="3" x2="3.3" y2="-3" width="0.127" layer="51"/>
<wire x1="3.3" y1="-3" x2="-3.3" y2="-3" width="0.2032" layer="21"/>
<wire x1="-3.3" y1="-3" x2="-3.3" y2="3" width="0.127" layer="51"/>
<wire x1="-3.3" y1="-1.2" x2="-3.3" y2="1.2" width="0.2032" layer="21"/>
<wire x1="3.3" y1="1.2" x2="3.3" y2="-1.2" width="0.2032" layer="21"/>
<circle x="0" y="0" radius="1.5033" width="0.2032" layer="21"/>
<circle x="0" y="0" radius="1" width="0.2032" layer="21"/>
<smd name="B" x="-3.4" y="2" dx="3.2" dy="1.2" layer="1"/>
<smd name="B'" x="3.4" y="2" dx="3.2" dy="1.2" layer="1"/>
<smd name="A'" x="3.4" y="-2" dx="3.2" dy="1.2" layer="1"/>
<smd name="A" x="-3.4" y="-2" dx="3.2" dy="1.2" layer="1"/>
<text x="-3.175" y="3.5" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-3.175" y="-3.683" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="BTN_KMR2_4.6X2.8">
<wire x1="-0.4" y1="0.4" x2="0" y2="0.4" width="0.127" layer="51"/>
<wire x1="0" y1="0.4" x2="0.4" y2="0.4" width="0.127" layer="51"/>
<wire x1="-0.4" y1="-0.4" x2="0" y2="-0.4" width="0.127" layer="51"/>
<wire x1="0" y1="-0.4" x2="0.4" y2="-0.4" width="0.127" layer="51"/>
<wire x1="0" y1="0.4" x2="0" y2="0.2" width="0.127" layer="51"/>
<wire x1="0" y1="-0.4" x2="0" y2="-0.3" width="0.127" layer="51"/>
<wire x1="0" y1="0.2" x2="0.3" y2="-0.1" width="0.127" layer="51"/>
<wire x1="-2.1" y1="1.4" x2="2.1" y2="1.4" width="0.2032" layer="51"/>
<wire x1="2.1" y1="1.4" x2="2.1" y2="-1.4" width="0.2032" layer="51"/>
<wire x1="2.1" y1="-1.4" x2="-2.1" y2="-1.4" width="0.2032" layer="51"/>
<wire x1="-2.1" y1="-1.4" x2="-2.1" y2="1.4" width="0.2032" layer="51"/>
<wire x1="-1.05" y1="-0.8" x2="-1.05" y2="0.8" width="0.2032" layer="51" curve="-44.999389"/>
<wire x1="-1.05" y1="0.8" x2="1.05" y2="0.8" width="0.2032" layer="51"/>
<wire x1="1.05" y1="0.8" x2="1.05" y2="-0.8" width="0.2032" layer="51" curve="-44.999389"/>
<wire x1="1.05" y1="-0.8" x2="-1.05" y2="-0.8" width="0.2032" layer="51"/>
<wire x1="-2.1" y1="1.5254" x2="2.1" y2="1.5254" width="0.2032" layer="21"/>
<wire x1="2.1" y1="-1.5254" x2="-2.1" y2="-1.5254" width="0.2032" layer="21"/>
<smd name="A" x="2.05" y="0.8" dx="0.9" dy="0.9" layer="1"/>
<smd name="B" x="2.05" y="-0.8" dx="0.9" dy="0.9" layer="1"/>
<smd name="B'" x="-2.05" y="-0.8" dx="0.9" dy="0.9" layer="1"/>
<smd name="A'" x="-2.05" y="0.8" dx="0.9" dy="0.9" layer="1"/>
<text x="-2.032" y="1.778" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-2.032" y="-2.159" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="BTN_EVQPQ_4.5MM">
<wire x1="-2.25" y1="2.25" x2="2.25" y2="2.25" width="0.127" layer="51"/>
<wire x1="2.25" y1="2.25" x2="2.25" y2="-2.25" width="0.127" layer="51"/>
<wire x1="2.25" y1="-2.25" x2="-2.25" y2="-2.25" width="0.127" layer="51"/>
<wire x1="-2.25" y1="-2.25" x2="-2.25" y2="2.25" width="0.127" layer="51"/>
<wire x1="-2.25" y1="-1.15" x2="-2.25" y2="1.15" width="0.2032" layer="21"/>
<wire x1="-1.25" y1="2.25" x2="1.25" y2="2.25" width="0.2032" layer="21"/>
<wire x1="2.25" y1="1.15" x2="2.25" y2="-1.15" width="0.2032" layer="21"/>
<wire x1="-1.25" y1="-2.25" x2="1.25" y2="-2.25" width="0.2032" layer="21"/>
<circle x="0" y="0" radius="2.15" width="0.2032" layer="51"/>
<smd name="A" x="-1.95" y="1.925" dx="0.9" dy="1" layer="1"/>
<smd name="B" x="1.95" y="1.925" dx="0.9" dy="1" layer="1"/>
<smd name="C" x="-1.95" y="-1.925" dx="0.9" dy="1" layer="1"/>
<smd name="D" x="1.95" y="-1.925" dx="0.9" dy="1" layer="1"/>
<text x="-2.286" y="2.794" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-2.286" y="-3.556" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="BTN_KMT0">
<description>&lt;p&gt;Source: http://media.digikey.com/pdf/Data%20Sheets/C&amp;K/KMT_0xx_NGJ_LHS_Drawing.pdf&lt;/p&gt;</description>
<smd name="A" x="-1.625" y="0.95" dx="0.95" dy="0.7" layer="1"/>
<smd name="B" x="-1.625" y="-0.95" dx="0.95" dy="0.7" layer="1"/>
<smd name="B'" x="1.625" y="-0.95" dx="0.95" dy="0.7" layer="1"/>
<smd name="A'" x="1.625" y="0.95" dx="0.95" dy="0.7" layer="1"/>
<wire x1="-1.15" y1="1.3" x2="-1.25" y2="1.2" width="0.05" layer="51" curve="90"/>
<wire x1="-1.25" y1="1.2" x2="-1.25" y2="0.7" width="0.05" layer="51"/>
<wire x1="-1.25" y1="0.7" x2="-1.4" y2="0.55" width="0.05" layer="51" curve="-90"/>
<wire x1="-1.4" y1="0.55" x2="-1.425" y2="0.55" width="0.05" layer="51"/>
<wire x1="-1.425" y1="0.55" x2="-1.5" y2="0.475" width="0.05" layer="51" curve="90"/>
<wire x1="-1.5" y1="0.475" x2="-1.5" y2="0.15" width="0.05" layer="51"/>
<wire x1="-1.5" y1="0.15" x2="-1.5" y2="-0.25" width="0.05" layer="51"/>
<wire x1="-1.5" y1="-0.25" x2="-1.5" y2="-0.5" width="0.05" layer="51"/>
<wire x1="-1.5" y1="-0.5" x2="-1.425" y2="-0.575" width="0.05" layer="51" curve="90"/>
<wire x1="-1.425" y1="-0.575" x2="-1.4" y2="-0.575" width="0.05" layer="51"/>
<wire x1="-1.4" y1="-0.575" x2="-1.25" y2="-0.725" width="0.05" layer="51" curve="-90"/>
<wire x1="-1.25" y1="-0.725" x2="-1.25" y2="-1.2" width="0.05" layer="51"/>
<wire x1="-1.25" y1="-1.2" x2="-1.125" y2="-1.325" width="0.05" layer="51" curve="90"/>
<wire x1="-1.125" y1="-1.325" x2="1.125" y2="-1.325" width="0.05" layer="51"/>
<wire x1="1.125" y1="-1.325" x2="1.25" y2="-1.2" width="0.05" layer="51" curve="90"/>
<wire x1="1.25" y1="-1.2" x2="1.25" y2="-0.7" width="0.05" layer="51"/>
<wire x1="1.25" y1="-0.7" x2="1.375" y2="-0.575" width="0.05" layer="51" curve="-90"/>
<wire x1="1.375" y1="-0.575" x2="1.425" y2="-0.575" width="0.05" layer="51"/>
<wire x1="1.425" y1="-0.575" x2="1.5" y2="-0.5" width="0.05" layer="51" curve="90"/>
<wire x1="1.5" y1="-0.5" x2="1.5" y2="-0.275" width="0.05" layer="51"/>
<wire x1="1.5" y1="-0.275" x2="1.5" y2="0.125" width="0.05" layer="51"/>
<wire x1="1.5" y1="0.125" x2="1.5" y2="0.475" width="0.05" layer="51"/>
<wire x1="1.5" y1="0.475" x2="1.425" y2="0.55" width="0.05" layer="51" curve="90"/>
<wire x1="1.4" y1="0.55" x2="1.35" y2="0.55" width="0.05" layer="51"/>
<wire x1="1.35" y1="0.55" x2="1.25" y2="0.65" width="0.05" layer="51" curve="-90"/>
<wire x1="1.25" y1="0.65" x2="1.25" y2="1.2" width="0.05" layer="51"/>
<wire x1="1.25" y1="1.2" x2="1.15" y2="1.3" width="0.05" layer="51" curve="90"/>
<wire x1="1.15" y1="1.3" x2="-1.15" y2="1.3" width="0.05" layer="51"/>
<wire x1="1.15" y1="1.3" x2="1.25" y2="1.3" width="0.05" layer="51"/>
<wire x1="1.25" y1="1.3" x2="1.375" y2="1.175" width="0.05" layer="51" curve="-90"/>
<wire x1="1.375" y1="1.175" x2="1.325" y2="1.175" width="0.05" layer="51"/>
<wire x1="1.325" y1="1.175" x2="1.325" y2="0.675" width="0.05" layer="51"/>
<wire x1="1.325" y1="0.675" x2="1.325" y2="0.625" width="0.05" layer="51"/>
<wire x1="1.325" y1="0.625" x2="1.4" y2="0.55" width="0.05" layer="51" curve="90"/>
<wire x1="1.4" y1="0.55" x2="1.425" y2="0.55" width="0.05" layer="51"/>
<wire x1="1.425" y1="0.55" x2="1.5" y2="0.475" width="0.05" layer="51" curve="-90"/>
<wire x1="1.5" y1="0.125" x2="1.55" y2="0.125" width="0.05" layer="51"/>
<wire x1="1.55" y1="0.125" x2="1.55" y2="-0.275" width="0.05" layer="51"/>
<wire x1="1.55" y1="-0.275" x2="1.5" y2="-0.275" width="0.05" layer="51"/>
<wire x1="1.375" y1="1.175" x2="1.625" y2="1.175" width="0.05" layer="51"/>
<wire x1="1.625" y1="1.175" x2="1.725" y2="1.175" width="0.05" layer="51"/>
<wire x1="1.725" y1="1.175" x2="1.725" y2="0.675" width="0.05" layer="51"/>
<wire x1="1.725" y1="0.675" x2="1.625" y2="0.675" width="0.05" layer="51"/>
<wire x1="1.625" y1="0.675" x2="1.5" y2="0.675" width="0.05" layer="51"/>
<wire x1="1.5" y1="0.675" x2="1.325" y2="0.675" width="0.05" layer="51"/>
<wire x1="1.5" y1="0.475" x2="1.5" y2="0.675" width="0.05" layer="51"/>
<wire x1="1.625" y1="1.175" x2="1.625" y2="0.675" width="0.05" layer="51"/>
<wire x1="1.325" y1="-0.725" x2="1.325" y2="-0.675" width="0.05" layer="51"/>
<wire x1="1.325" y1="-0.675" x2="1.425" y2="-0.575" width="0.05" layer="51" curve="-90"/>
<wire x1="1.325" y1="-0.725" x2="1.5" y2="-0.725" width="0.05" layer="51"/>
<wire x1="1.5" y1="-0.725" x2="1.6" y2="-0.725" width="0.05" layer="51"/>
<wire x1="1.6" y1="-0.725" x2="1.7" y2="-0.725" width="0.05" layer="51"/>
<wire x1="1.7" y1="-0.725" x2="1.7" y2="-1.225" width="0.05" layer="51"/>
<wire x1="1.7" y1="-1.225" x2="1.6" y2="-1.225" width="0.05" layer="51"/>
<wire x1="1.6" y1="-1.225" x2="1.375" y2="-1.225" width="0.05" layer="51"/>
<wire x1="1.375" y1="-1.225" x2="1.325" y2="-1.225" width="0.05" layer="51"/>
<wire x1="1.325" y1="-1.225" x2="1.325" y2="-0.725" width="0.05" layer="51"/>
<wire x1="1.6" y1="-0.725" x2="1.6" y2="-1.225" width="0.05" layer="51"/>
<wire x1="1.125" y1="-1.325" x2="1.275" y2="-1.325" width="0.05" layer="51"/>
<wire x1="1.275" y1="-1.325" x2="1.375" y2="-1.225" width="0.05" layer="51" curve="90"/>
<wire x1="1.5" y1="-0.5" x2="1.5" y2="-0.725" width="0.05" layer="51"/>
<wire x1="-1.05" y1="1.225" x2="1.05" y2="1.225" width="0.05" layer="51"/>
<wire x1="1.05" y1="1.225" x2="1.175" y2="1.1" width="0.05" layer="51" curve="-90"/>
<wire x1="1.175" y1="1.1" x2="1.175" y2="0.675" width="0.05" layer="51"/>
<wire x1="1.175" y1="0.675" x2="1.325" y2="0.525" width="0.05" layer="51" curve="90"/>
<wire x1="1.325" y1="0.525" x2="1.35" y2="0.525" width="0.05" layer="51"/>
<wire x1="1.35" y1="0.525" x2="1.45" y2="0.425" width="0.05" layer="51" curve="-90"/>
<wire x1="1.45" y1="0.425" x2="1.45" y2="-0.45" width="0.05" layer="51"/>
<wire x1="1.45" y1="-0.45" x2="1.325" y2="-0.575" width="0.05" layer="51" curve="-90"/>
<wire x1="1.325" y1="-0.575" x2="1.3" y2="-0.575" width="0.05" layer="51"/>
<wire x1="1.3" y1="-0.575" x2="1.175" y2="-0.7" width="0.05" layer="51" curve="90"/>
<wire x1="1.175" y1="-0.7" x2="1.175" y2="-1.125" width="0.05" layer="51"/>
<wire x1="1.175" y1="-1.125" x2="1.05" y2="-1.25" width="0.05" layer="51" curve="-90"/>
<wire x1="1.05" y1="-1.25" x2="-1.025" y2="-1.25" width="0.05" layer="51"/>
<wire x1="-1.025" y1="-1.25" x2="-1.175" y2="-1.1" width="0.05" layer="51" curve="-90"/>
<wire x1="-1.175" y1="-1.1" x2="-1.175" y2="-0.725" width="0.05" layer="51"/>
<wire x1="-1.175" y1="-0.725" x2="-1.35" y2="-0.55" width="0.05" layer="51" curve="90"/>
<wire x1="-1.35" y1="-0.55" x2="-1.375" y2="-0.55" width="0.05" layer="51"/>
<wire x1="-1.375" y1="-0.55" x2="-1.45" y2="-0.475" width="0.05" layer="51" curve="-90"/>
<wire x1="-1.45" y1="-0.475" x2="-1.45" y2="0.425" width="0.05" layer="51"/>
<wire x1="-1.45" y1="0.425" x2="-1.35" y2="0.525" width="0.05" layer="51" curve="-90"/>
<wire x1="-1.35" y1="0.525" x2="-1.325" y2="0.525" width="0.05" layer="51"/>
<wire x1="-1.325" y1="0.525" x2="-1.175" y2="0.675" width="0.05" layer="51" curve="90"/>
<wire x1="-1.175" y1="0.675" x2="-1.175" y2="1.1" width="0.05" layer="51"/>
<wire x1="-1.175" y1="1.1" x2="-1.05" y2="1.225" width="0.05" layer="51" curve="-90"/>
<wire x1="-1.15" y1="1.3" x2="-1.275" y2="1.3" width="0.05" layer="51"/>
<wire x1="-1.275" y1="1.3" x2="-1.375" y2="1.2" width="0.05" layer="51" curve="90"/>
<wire x1="-1.7" y1="1.2" x2="-1.6" y2="1.2" width="0.05" layer="51"/>
<wire x1="-1.6" y1="1.2" x2="-1.35" y2="1.2" width="0.05" layer="51"/>
<wire x1="-1.35" y1="1.2" x2="-1.35" y2="0.7" width="0.05" layer="51"/>
<wire x1="-1.35" y1="0.7" x2="-1.5" y2="0.7" width="0.05" layer="51"/>
<wire x1="-1.5" y1="0.7" x2="-1.6" y2="0.7" width="0.05" layer="51"/>
<wire x1="-1.6" y1="0.7" x2="-1.7" y2="0.7" width="0.05" layer="51"/>
<wire x1="-1.7" y1="0.7" x2="-1.7" y2="1.2" width="0.05" layer="51"/>
<wire x1="-1.6" y1="1.2" x2="-1.6" y2="0.7" width="0.05" layer="51"/>
<wire x1="-1.35" y1="0.7" x2="-1.35" y2="0.625" width="0.05" layer="51"/>
<wire x1="-1.35" y1="0.625" x2="-1.425" y2="0.55" width="0.05" layer="51" curve="-90"/>
<wire x1="-1.5" y1="0.15" x2="-1.55" y2="0.15" width="0.05" layer="51"/>
<wire x1="-1.55" y1="0.15" x2="-1.55" y2="-0.25" width="0.05" layer="51"/>
<wire x1="-1.55" y1="-0.25" x2="-1.5" y2="-0.25" width="0.05" layer="51"/>
<wire x1="-1.5" y1="0.475" x2="-1.5" y2="0.7" width="0.05" layer="51"/>
<wire x1="-1.125" y1="-1.325" x2="-1.275" y2="-1.325" width="0.05" layer="51"/>
<wire x1="-1.275" y1="-1.325" x2="-1.375" y2="-1.225" width="0.05" layer="51" curve="-90"/>
<wire x1="-1.25" y1="-1.225" x2="-1.35" y2="-1.225" width="0.05" layer="51"/>
<wire x1="-1.35" y1="-1.225" x2="-1.625" y2="-1.225" width="0.05" layer="51"/>
<wire x1="-1.625" y1="-1.225" x2="-1.725" y2="-1.225" width="0.05" layer="51"/>
<wire x1="-1.725" y1="-1.225" x2="-1.725" y2="-0.725" width="0.05" layer="51"/>
<wire x1="-1.725" y1="-0.725" x2="-1.625" y2="-0.725" width="0.05" layer="51"/>
<wire x1="-1.625" y1="-0.725" x2="-1.5" y2="-0.725" width="0.05" layer="51"/>
<wire x1="-1.5" y1="-0.725" x2="-1.35" y2="-0.725" width="0.05" layer="51"/>
<wire x1="-1.35" y1="-0.725" x2="-1.35" y2="-1.225" width="0.05" layer="51"/>
<wire x1="-1.625" y1="-0.725" x2="-1.625" y2="-1.225" width="0.05" layer="51"/>
<wire x1="-1.35" y1="-0.725" x2="-1.35" y2="-0.65" width="0.05" layer="51"/>
<wire x1="-1.35" y1="-0.65" x2="-1.425" y2="-0.575" width="0.05" layer="51" curve="90"/>
<wire x1="-1.5" y1="-0.5" x2="-1.5" y2="-0.725" width="0.05" layer="51"/>
<circle x="0" y="0" radius="0.391309375" width="0.05" layer="51"/>
<circle x="0" y="0" radius="1.053859375" width="0.05" layer="51"/>
<text x="-1.732" y="1.503" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-1.507" y="-1.884" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<wire x1="-0.975" y1="1.3" x2="0.975" y2="1.3" width="0.05" layer="21"/>
<wire x1="-1.5" y1="0.475" x2="-1.5" y2="-0.475" width="0.05" layer="21"/>
<wire x1="1.5" y1="0.475" x2="1.5" y2="-0.475" width="0.05" layer="21"/>
<wire x1="-0.975" y1="-1.325" x2="0.975" y2="-1.325" width="0.05" layer="21"/>
</package>
<package name="EVQ-Q2_SMALLER">
<wire x1="-3.3" y1="3" x2="3.3" y2="3" width="0.2032" layer="21"/>
<wire x1="3.3" y1="3" x2="3.3" y2="-3" width="0.127" layer="51"/>
<wire x1="3.3" y1="-3" x2="-3.3" y2="-3" width="0.2032" layer="21"/>
<wire x1="-3.3" y1="-3" x2="-3.3" y2="3" width="0.127" layer="51"/>
<wire x1="-3.3" y1="-1.2" x2="-3.3" y2="1.2" width="0.2032" layer="21"/>
<wire x1="3.3" y1="1.2" x2="3.3" y2="-1.2" width="0.2032" layer="21"/>
<circle x="0" y="0" radius="1.5033" width="0.2032" layer="21"/>
<circle x="0" y="0" radius="1" width="0.2032" layer="21"/>
<smd name="B" x="-3.1" y="2" dx="2" dy="1.2" layer="1"/>
<smd name="B'" x="3.1" y="2" dx="2" dy="1.2" layer="1"/>
<smd name="A'" x="3.1" y="-2" dx="2" dy="1.2" layer="1"/>
<smd name="A" x="-3.1" y="-2" dx="2" dy="1.2" layer="1"/>
<text x="-3.175" y="3.5" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-3.175" y="-3.683" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="B3F-40XX-SMT">
<wire x1="-1.905" y1="1.905" x2="1.905" y2="1.905" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.905" x2="1.905" y2="1.905" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.905" x2="-1.905" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.905" x2="-1.905" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.651" y1="1.651" x2="1.651" y2="1.651" width="0.0508" layer="21"/>
<wire x1="1.651" y1="-1.651" x2="1.651" y2="1.651" width="0.0508" layer="21"/>
<wire x1="1.651" y1="-1.651" x2="-1.651" y2="-1.651" width="0.0508" layer="21"/>
<wire x1="-1.651" y1="1.651" x2="-1.651" y2="-1.651" width="0.0508" layer="21"/>
<wire x1="-1.016" y1="6.096" x2="-1.016" y2="6.477" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="6.096" x2="1.016" y2="6.096" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="6.477" x2="1.016" y2="6.477" width="0.1524" layer="21"/>
<wire x1="1.016" y1="6.477" x2="1.016" y2="6.096" width="0.1524" layer="21"/>
<wire x1="6.096" y1="5.08" x2="5.08" y2="6.096" width="0.1524" layer="21"/>
<wire x1="5.08" y1="6.096" x2="1.778" y2="6.096" width="0.1524" layer="21"/>
<wire x1="6.096" y1="5.08" x2="6.096" y2="3.81" width="0.1524" layer="21"/>
<wire x1="6.096" y1="1.143" x2="6.096" y2="3.81" width="0.1524" layer="51"/>
<wire x1="6.096" y1="1.143" x2="6.096" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="6.096" y1="-3.81" x2="6.096" y2="-1.143" width="0.1524" layer="51"/>
<wire x1="5.08" y1="-6.096" x2="6.096" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="6.096" y1="-5.08" x2="6.096" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="-6.096" y1="1.143" x2="-6.096" y2="3.81" width="0.1524" layer="51"/>
<wire x1="-6.096" y1="1.143" x2="-6.096" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="-6.096" y1="-3.81" x2="-6.096" y2="-1.143" width="0.1524" layer="51"/>
<wire x1="-6.096" y1="-3.81" x2="-6.096" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="-6.096" y1="-5.08" x2="-5.08" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-6.096" x2="-1.778" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="6.096" x2="-1.778" y2="6.096" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="6.096" x2="-6.096" y2="5.08" width="0.1524" layer="21"/>
<wire x1="-6.096" y1="5.08" x2="-6.096" y2="3.81" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="-6.477" x2="1.016" y2="-6.477" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="-6.477" x2="-1.016" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="1.016" y1="-6.096" x2="1.016" y2="-6.477" width="0.1524" layer="21"/>
<wire x1="5.08" y1="6.096" x2="4.826" y2="6.35" width="0.1524" layer="21"/>
<wire x1="4.826" y1="6.35" x2="1.778" y2="6.35" width="0.1524" layer="21"/>
<wire x1="1.778" y1="6.35" x2="1.778" y2="6.096" width="0.1524" layer="21"/>
<wire x1="1.778" y1="6.096" x2="1.016" y2="6.096" width="0.1524" layer="21"/>
<wire x1="-1.778" y1="6.35" x2="-1.778" y2="6.096" width="0.1524" layer="21"/>
<wire x1="-1.778" y1="6.096" x2="-1.016" y2="6.096" width="0.1524" layer="21"/>
<wire x1="-1.778" y1="6.35" x2="-4.826" y2="6.35" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="6.096" x2="-4.826" y2="6.35" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="-6.096" x2="1.016" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="1.016" y1="-6.096" x2="1.778" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="-1.778" y1="-6.096" x2="-1.778" y2="-6.35" width="0.1524" layer="21"/>
<wire x1="-1.778" y1="-6.096" x2="-1.016" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="-1.778" y1="-6.35" x2="-4.826" y2="-6.35" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="-6.35" x2="-5.08" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="1.778" y1="-6.096" x2="1.778" y2="-6.35" width="0.1524" layer="21"/>
<wire x1="1.778" y1="-6.096" x2="5.08" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="4.826" y1="-6.35" x2="1.778" y2="-6.35" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-6.096" x2="4.826" y2="-6.35" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="2.54" x2="-4.572" y2="2.54" width="0.1524" layer="51"/>
<wire x1="2.921" y1="2.54" x2="5.08" y2="2.54" width="0.1524" layer="51"/>
<wire x1="-5.08" y1="-2.54" x2="-4.572" y2="-2.54" width="0.1524" layer="51"/>
<wire x1="2.921" y1="-2.54" x2="5.08" y2="-2.54" width="0.1524" layer="51"/>
<wire x1="-4.572" y1="2.54" x2="-4.572" y2="0.762" width="0.1524" layer="51"/>
<wire x1="-4.572" y1="2.54" x2="-2.921" y2="2.54" width="0.1524" layer="51"/>
<wire x1="-4.572" y1="0.762" x2="-5.08" y2="-0.762" width="0.1524" layer="51"/>
<wire x1="-4.572" y1="-0.762" x2="-4.572" y2="-2.54" width="0.1524" layer="51"/>
<wire x1="-4.572" y1="-2.54" x2="-2.921" y2="-2.54" width="0.1524" layer="51"/>
<circle x="0" y="0" radius="3.556" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="1.016" width="0.0508" layer="21"/>
<circle x="0" y="0" radius="0.762" width="0.0508" layer="21"/>
<circle x="-4.572" y="2.54" radius="0.127" width="0.1524" layer="51"/>
<circle x="-4.572" y="-2.54" radius="0.127" width="0.1524" layer="51"/>
<text x="-5.08" y="6.985" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-5.08" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-5.207" y="3.302" size="1.27" layer="21" ratio="10">1</text>
<text x="3.937" y="3.302" size="1.27" layer="21" ratio="10">2</text>
<text x="-5.207" y="-4.699" size="1.27" layer="21" ratio="10">3</text>
<text x="4.064" y="-4.699" size="1.27" layer="21" ratio="10">4</text>
<rectangle x1="6.096" y1="-2.921" x2="6.604" y2="-2.032" layer="51"/>
<rectangle x1="6.096" y1="2.032" x2="6.604" y2="2.921" layer="51"/>
<rectangle x1="-6.604" y1="2.032" x2="-6.096" y2="2.921" layer="51"/>
<rectangle x1="-6.604" y1="-2.921" x2="-6.096" y2="-2.032" layer="51"/>
<rectangle x1="2.286" y1="5.842" x2="4.445" y2="6.35" layer="21"/>
<rectangle x1="-4.445" y1="5.842" x2="-2.286" y2="6.35" layer="21"/>
<rectangle x1="2.286" y1="-6.35" x2="4.445" y2="-5.842" layer="21"/>
<rectangle x1="-4.445" y1="-6.35" x2="-2.286" y2="-5.842" layer="21"/>
<hole x="0" y="-4.4958" drill="1.8034"/>
<hole x="0" y="4.4958" drill="1.8034"/>
<smd name="P$1" x="-7" y="2.5" dx="2" dy="2" layer="1"/>
<smd name="P$2" x="7" y="2.5" dx="2" dy="2" layer="1"/>
<smd name="P$3" x="-7" y="-2.5" dx="2" dy="2" layer="1"/>
<smd name="P$4" x="7" y="-2.5" dx="2" dy="2" layer="1"/>
</package>
<package name="SOT23-5">
<description>&lt;b&gt;Small Outline Transistor&lt;/b&gt; - 5 Pin</description>
<wire x1="1.4224" y1="0.8104" x2="1.4224" y2="-0.8104" width="0.2032" layer="51"/>
<wire x1="1.4224" y1="-0.8104" x2="-1.4224" y2="-0.8104" width="0.2032" layer="51"/>
<wire x1="-1.4224" y1="-0.8104" x2="-1.4224" y2="0.8104" width="0.2032" layer="51"/>
<wire x1="-1.4224" y1="0.8104" x2="1.4224" y2="0.8104" width="0.2032" layer="51"/>
<wire x1="-1.65" y1="0.8" x2="-1.65" y2="-0.8" width="0.2032" layer="21"/>
<wire x1="1.65" y1="0.8" x2="1.65" y2="-0.8" width="0.2032" layer="21"/>
<smd name="1" x="-0.95" y="-1.3001" dx="0.55" dy="1.2" layer="1"/>
<smd name="2" x="0" y="-1.3001" dx="0.55" dy="1.2" layer="1"/>
<smd name="3" x="0.95" y="-1.3001" dx="0.55" dy="1.2" layer="1"/>
<smd name="4" x="0.95" y="1.3001" dx="0.55" dy="1.2" layer="1"/>
<smd name="5" x="-0.95" y="1.3001" dx="0.55" dy="1.2" layer="1"/>
<text x="1.978" y="0" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="1.978" y="-0.635" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-1.2" y1="-1.5" x2="-0.7" y2="-0.85" layer="51"/>
<rectangle x1="-0.25" y1="-1.5" x2="0.25" y2="-0.85" layer="51"/>
<rectangle x1="0.7" y1="-1.5" x2="1.2" y2="-0.85" layer="51"/>
<rectangle x1="0.7" y1="0.85" x2="1.2" y2="1.5" layer="51"/>
<rectangle x1="-1.2" y1="0.85" x2="-0.7" y2="1.5" layer="51"/>
<wire x1="-0.4" y1="1.05" x2="0.4" y2="1.05" width="0.2032" layer="21"/>
</package>
<package name="SMADIODE">
<description>&lt;b&gt;SMA Surface Mount Diode&lt;/b&gt;</description>
<wire x1="-2.15" y1="1.3" x2="2.15" y2="1.3" width="0.2032" layer="51"/>
<wire x1="2.15" y1="1.3" x2="2.15" y2="-1.3" width="0.2032" layer="51"/>
<wire x1="2.15" y1="-1.3" x2="-2.15" y2="-1.3" width="0.2032" layer="51"/>
<wire x1="-2.15" y1="-1.3" x2="-2.15" y2="1.3" width="0.2032" layer="51"/>
<wire x1="-3.889" y1="-1.146" x2="-3.889" y2="1.6" width="0.2032" layer="21"/>
<wire x1="-3.889" y1="1.6" x2="3.916" y2="1.6" width="0.2032" layer="21"/>
<wire x1="3.916" y1="1.6" x2="3.916" y2="1.394" width="0.2032" layer="21"/>
<wire x1="3.916" y1="1.394" x2="3.916" y2="-1.6" width="0.2032" layer="21"/>
<wire x1="3.916" y1="-1.6" x2="-3.889" y2="-1.6" width="0.2032" layer="21"/>
<wire x1="-3.889" y1="-1.6" x2="-3.889" y2="-1.146" width="0.2032" layer="21"/>
<wire x1="0.254" y1="0.762" x2="0.254" y2="-0.762" width="0.2032" layer="21"/>
<wire x1="0.254" y1="-0.762" x2="-0.508" y2="0" width="0.2032" layer="21"/>
<wire x1="-0.508" y1="0" x2="0.254" y2="0.762" width="0.2032" layer="21"/>
<wire x1="-0.508" y1="0.762" x2="-0.508" y2="0" width="0.2032" layer="21"/>
<wire x1="-0.508" y1="0" x2="-0.508" y2="-0.762" width="0.2032" layer="21"/>
<smd name="C" x="-2.3495" y="0" dx="2.54" dy="2.54" layer="1"/>
<smd name="A" x="2.3495" y="0" dx="2.54" dy="2.54" layer="1" rot="R180"/>
<text x="-2.54" y="1.905" size="0.8128" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="-2.54" y="-2.286" size="0.4064" layer="27" font="vector" ratio="10">&gt;VALUE</text>
<rectangle x1="-2.825" y1="-1.1" x2="-2.175" y2="1.1" layer="51"/>
<rectangle x1="2.175" y1="-1.1" x2="2.825" y2="1.1" layer="51" rot="R180"/>
<rectangle x1="-1.75" y1="-1.225" x2="-1.075" y2="1.225" layer="51"/>
</package>
<package name="DO-1N4148">
<wire x1="-2.54" y1="0.762" x2="2.54" y2="0.762" width="0.2032" layer="21"/>
<wire x1="2.54" y1="0.762" x2="2.54" y2="0" width="0.2032" layer="21"/>
<wire x1="2.54" y1="0" x2="2.54" y2="-0.762" width="0.2032" layer="21"/>
<wire x1="2.54" y1="-0.762" x2="-2.54" y2="-0.762" width="0.2032" layer="21"/>
<wire x1="-2.54" y1="-0.762" x2="-2.54" y2="0" width="0.2032" layer="21"/>
<wire x1="-2.54" y1="0" x2="-2.54" y2="0.762" width="0.2032" layer="21"/>
<wire x1="2.54" y1="0" x2="2.794" y2="0" width="0.2032" layer="21"/>
<wire x1="-2.54" y1="0" x2="-2.794" y2="0" width="0.2032" layer="21"/>
<wire x1="1.905" y1="0.635" x2="1.905" y2="-0.635" width="0.2032" layer="21"/>
<pad name="A" x="-3.81" y="0" drill="0.9"/>
<pad name="C" x="3.81" y="0" drill="0.9"/>
<text x="-2.286" y="1.143" size="0.8128" layer="25" ratio="18">&gt;Name</text>
<text x="-2.286" y="-0.381" size="0.8128" layer="21">&gt;Value</text>
</package>
<package name="SOT23-R">
<description>&lt;b&gt;SOT23&lt;/b&gt; - Reflow soldering</description>
<wire x1="1.5724" y1="0.6604" x2="1.5724" y2="-0.6604" width="0.1524" layer="51"/>
<wire x1="1.5724" y1="-0.6604" x2="-1.5724" y2="-0.6604" width="0.1524" layer="51"/>
<wire x1="-1.5724" y1="-0.6604" x2="-1.5724" y2="0.6604" width="0.1524" layer="51"/>
<wire x1="-1.5724" y1="0.6604" x2="1.5724" y2="0.6604" width="0.2032" layer="51"/>
<wire x1="-1.5724" y1="-0.6524" x2="-1.5724" y2="0.6604" width="0.2032" layer="21"/>
<wire x1="-1.5724" y1="0.6604" x2="-0.5636" y2="0.6604" width="0.2032" layer="21"/>
<wire x1="1.5724" y1="0.6604" x2="1.5724" y2="-0.6524" width="0.2032" layer="21"/>
<wire x1="0.5636" y1="0.6604" x2="1.5724" y2="0.6604" width="0.2032" layer="21"/>
<wire x1="0.3724" y1="-0.6604" x2="-0.3864" y2="-0.6604" width="0.2032" layer="21"/>
<smd name="3" x="0" y="1" dx="0.635" dy="1.016" layer="1"/>
<smd name="2" x="0.95" y="-1" dx="0.635" dy="1.016" layer="1"/>
<smd name="1" x="-0.95" y="-1" dx="0.635" dy="1.016" layer="1"/>
<text x="1.778" y="-0.127" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="1.778" y="-0.635" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-0.2286" y1="0.7112" x2="0.2286" y2="1.2954" layer="51"/>
<rectangle x1="0.7112" y1="-1.2954" x2="1.1684" y2="-0.7112" layer="51"/>
<rectangle x1="-1.1684" y1="-1.2954" x2="-0.7112" y2="-0.7112" layer="51"/>
</package>
<package name="SOD-523">
<description>SOD-523 (0.8x1.2mm)

&lt;p&gt;Source: http://www.rohm.com/products/databook/di/pdf/rb751s-40.pdf&lt;/p&gt;</description>
<smd name="K" x="0" y="0.75" dx="0.8" dy="0.6" layer="1"/>
<smd name="A" x="0" y="-0.75" dx="0.8" dy="0.6" layer="1"/>
<text x="0.716" y="0.016" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="0.716" y="-0.724" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<wire x1="0.4254" y1="0.6" x2="0.4254" y2="-0.6" width="0.127" layer="21"/>
<wire x1="0.4" y1="-0.6" x2="-0.4" y2="-0.6" width="0.127" layer="51"/>
<wire x1="-0.4254" y1="-0.6" x2="-0.4254" y2="0.6" width="0.127" layer="21"/>
<wire x1="-0.4" y1="0.6" x2="0.4" y2="0.6" width="0.127" layer="51"/>
<wire x1="0" y1="0.05" x2="0.25" y2="-0.2" width="0.127" layer="21"/>
<wire x1="0.25" y1="-0.2" x2="-0.25" y2="-0.2" width="0.127" layer="21"/>
<wire x1="-0.25" y1="-0.2" x2="0" y2="0.05" width="0.127" layer="21"/>
<rectangle x1="-0.1" y1="0.45" x2="0.1" y2="0.85" layer="51" rot="R270"/>
<rectangle x1="-0.1" y1="-0.85" x2="0.1" y2="-0.45" layer="51" rot="R270"/>
<rectangle x1="-0.1" y1="-0.2254" x2="0.1" y2="0.5746" layer="21" rot="R270"/>
<polygon width="0.0508" layer="21">
<vertex x="0" y="0.05"/>
<vertex x="0.25" y="-0.2"/>
<vertex x="-0.25" y="-0.2"/>
</polygon>
</package>
<package name="SOD-323">
<description>&lt;b&gt;SOD323&lt;/b&gt; (2.5x1.2mm)</description>
<smd name="C" x="-1.27" y="0" dx="1.35" dy="0.8" layer="1"/>
<smd name="A" x="1.27" y="0" dx="1.35" dy="0.8" layer="1"/>
<text x="-1.1" y="1" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-1.1" y="-1.792" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<wire x1="-1" y1="0.7" x2="1" y2="0.7" width="0.2032" layer="21"/>
<wire x1="1" y1="0.7" x2="1" y2="-0.7" width="0.2032" layer="51"/>
<wire x1="1" y1="-0.7" x2="-1" y2="-0.7" width="0.2032" layer="21"/>
<wire x1="-1" y1="-0.7" x2="-1" y2="0.7" width="0.2032" layer="51"/>
<wire x1="-0.25" y1="0" x2="0.35" y2="0.4" width="0.2032" layer="21"/>
<wire x1="0.35" y1="0.4" x2="0.35" y2="-0.4" width="0.2032" layer="21"/>
<wire x1="0.35" y1="-0.4" x2="-0.25" y2="0" width="0.2032" layer="21"/>
<rectangle x1="-0.45" y1="-0.5" x2="-0.25" y2="0.5" layer="21"/>
<polygon width="0.2032" layer="21">
<vertex x="-0.1" y="0"/>
<vertex x="0.2" y="0.2"/>
<vertex x="0.2" y="-0.2"/>
</polygon>
</package>
<package name="SOD-123">
<description>&lt;b&gt;SOD-123&lt;/b&gt;
&lt;p&gt;Source: http://www.diodes.com/datasheets/ds30139.pdf&lt;/p&gt;</description>
<smd name="C" x="-1.85" y="0" dx="1.4" dy="1.4" layer="1" rot="R90"/>
<smd name="A" x="1.85" y="0" dx="1.4" dy="1.4" layer="1" rot="R90"/>
<text x="-1.27" y="1.016" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-1.27" y="-1.778" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<wire x1="-0.873" y1="0.7" x2="0.873" y2="0.7" width="0.2032" layer="21"/>
<wire x1="0.873" y1="0.7" x2="0.873" y2="-0.7" width="0.2032" layer="51"/>
<wire x1="0.873" y1="-0.7" x2="-0.873" y2="-0.7" width="0.2032" layer="21"/>
<wire x1="-0.873" y1="-0.7" x2="-0.873" y2="0.7" width="0.2032" layer="51"/>
<wire x1="-0.3" y1="0" x2="0.3" y2="0.4" width="0.2032" layer="21"/>
<wire x1="0.3" y1="0.4" x2="0.3" y2="-0.4" width="0.2032" layer="21"/>
<wire x1="0.3" y1="-0.4" x2="-0.3" y2="0" width="0.2032" layer="21"/>
<rectangle x1="-1.723" y1="-0.45" x2="-0.973" y2="0.4" layer="51"/>
<rectangle x1="0.973" y1="-0.45" x2="1.723" y2="0.4" layer="51"/>
<rectangle x1="-0.5" y1="-0.5" x2="-0.3" y2="0.5" layer="21"/>
<polygon width="0.2032" layer="21">
<vertex x="-0.1" y="0"/>
<vertex x="0.2" y="0.2"/>
<vertex x="0.2" y="-0.2"/>
</polygon>
</package>
<package name="SOT23-WIDE">
<wire x1="1.5724" y1="0.6604" x2="1.5724" y2="-0.6604" width="0.2032" layer="51"/>
<wire x1="1.5724" y1="-0.6604" x2="-1.5724" y2="-0.6604" width="0.1524" layer="51"/>
<wire x1="-1.5724" y1="-0.6604" x2="-1.5724" y2="0.6604" width="0.2032" layer="51"/>
<wire x1="-1.5724" y1="0.6604" x2="1.5724" y2="0.6604" width="0.2032" layer="51"/>
<wire x1="-1.6724" y1="-0.6524" x2="-1.6724" y2="0.6604" width="0.2032" layer="21"/>
<wire x1="-1.6724" y1="0.6604" x2="-0.7136" y2="0.6604" width="0.2032" layer="21"/>
<wire x1="1.6724" y1="0.6604" x2="1.6724" y2="-0.6524" width="0.2032" layer="21"/>
<wire x1="0.7136" y1="0.6604" x2="1.6724" y2="0.6604" width="0.2032" layer="21"/>
<wire x1="0.2224" y1="-0.6604" x2="-0.2364" y2="-0.6604" width="0.2032" layer="21"/>
<smd name="3" x="0" y="1" dx="1" dy="1.2" layer="1"/>
<smd name="2" x="0.95" y="-1" dx="1" dy="1.2" layer="1"/>
<smd name="1" x="-0.95" y="-1" dx="1" dy="1.2" layer="1"/>
<text x="1.905" y="0" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="1.905" y="-0.635" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-0.2286" y1="0.7112" x2="0.2286" y2="1.2954" layer="51"/>
<rectangle x1="0.7112" y1="-1.2954" x2="1.1684" y2="-0.7112" layer="51"/>
<rectangle x1="-1.1684" y1="-1.2954" x2="-0.7112" y2="-0.7112" layer="51"/>
</package>
<package name="POWERDI-5">
<smd name="A1" x="-0.92" y="-2.84" dx="1.39" dy="1.4" layer="1"/>
<smd name="A2" x="0.92" y="-2.84" dx="1.39" dy="1.4" layer="1"/>
<smd name="C" x="0" y="1.142" dx="3.36" dy="4.86" layer="1"/>
<wire x1="-2" y1="3.25" x2="2" y2="3.25" width="0.127" layer="51"/>
<wire x1="2" y1="3.25" x2="2" y2="-3.25" width="0.127" layer="51"/>
<wire x1="2" y1="-3.25" x2="-2" y2="-3.25" width="0.127" layer="51"/>
<wire x1="-2" y1="-3.25" x2="-2" y2="3.25" width="0.127" layer="51"/>
<wire x1="-1.8" y1="-3" x2="-2.1" y2="-3" width="0.127" layer="21"/>
<wire x1="-2.1" y1="-3" x2="-2.1" y2="3" width="0.127" layer="21"/>
<wire x1="-2.1" y1="3" x2="-1.9" y2="3" width="0.127" layer="21"/>
<wire x1="1.9" y1="3.1" x2="2.1" y2="3.1" width="0.127" layer="21"/>
<wire x1="2.1" y1="3.1" x2="2.1" y2="-3" width="0.127" layer="21"/>
<wire x1="2.1" y1="-3" x2="1.8" y2="-3" width="0.127" layer="21"/>
<text x="-2.34" y="-2.99" size="0.8128" layer="25" ratio="18" rot="R90">&gt;NAME</text>
<text x="2.66" y="-3.04" size="0.4064" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<polygon width="0.3048" layer="51">
<vertex x="-1.5" y="-0.6"/>
<vertex x="0" y="1.9"/>
<vertex x="1.5" y="-0.6"/>
</polygon>
<rectangle x1="-1.6" y1="2" x2="1.6" y2="2.4" layer="51"/>
</package>
<package name="JSTPH2">
<description>2-Pin JST PH Series Right-Angle Connector (+/- for batteries)</description>
<wire x1="-4" y1="3" x2="4" y2="3" width="0.2032" layer="51"/>
<wire x1="4" y1="3" x2="4" y2="-4.5" width="0.2032" layer="51"/>
<wire x1="-4" y1="-4.5" x2="-4" y2="3" width="0.2032" layer="51"/>
<wire x1="3.2" y1="-2" x2="-3.2" y2="-2" width="0.2032" layer="51"/>
<wire x1="-3.2" y1="-2" x2="-3.2" y2="-4.5" width="0.2032" layer="51"/>
<wire x1="-3.2" y1="-4.5" x2="-4" y2="-4.5" width="0.2032" layer="51"/>
<wire x1="4" y1="-4.5" x2="3.2" y2="-4.5" width="0.2032" layer="51"/>
<wire x1="3.2" y1="-4.5" x2="3.2" y2="-2" width="0.2032" layer="51"/>
<wire x1="-2.25" y1="3" x2="2.25" y2="3" width="0.2032" layer="21"/>
<wire x1="4" y1="-0.5" x2="4" y2="-4.5" width="0.2032" layer="21"/>
<wire x1="4" y1="-4.5" x2="3.15" y2="-4.5" width="0.2032" layer="21"/>
<wire x1="3.15" y1="-4.5" x2="3.15" y2="-2" width="0.2032" layer="21"/>
<wire x1="3.15" y1="-2" x2="1.75" y2="-2" width="0.2032" layer="21"/>
<wire x1="-1.75" y1="-2" x2="-3.15" y2="-2" width="0.2032" layer="21"/>
<wire x1="-3.15" y1="-2" x2="-3.15" y2="-4.5" width="0.2032" layer="21"/>
<wire x1="-3.15" y1="-4.5" x2="-4" y2="-4.5" width="0.2032" layer="21"/>
<wire x1="-4" y1="-4.5" x2="-4" y2="-0.5" width="0.2032" layer="21"/>
<smd name="1" x="-1" y="-3.7" dx="1" dy="4.6" layer="1"/>
<smd name="2" x="1" y="-3.7" dx="1" dy="4.6" layer="1"/>
<smd name="NC1" x="-3.4" y="1.5" dx="3.4" dy="1.6" layer="1" rot="R90"/>
<smd name="NC2" x="3.4" y="1.5" dx="3.4" dy="1.6" layer="1" rot="R90"/>
<text x="-2.2225" y="1.9685" size="0.8128" layer="25" ratio="18">&gt;Name</text>
<text x="-2.2225" y="1.27" size="0.4064" layer="27" ratio="10">&gt;Value</text>
</package>
<package name="JSTSH2">
<wire x1="2" y1="2.125" x2="-2" y2="2.125" width="0.127" layer="20"/>
<wire x1="-2" y1="2.125" x2="-2" y2="-2.125" width="0.127" layer="20"/>
<wire x1="-2" y1="-2.125" x2="2" y2="-2.125" width="0.127" layer="20"/>
<wire x1="2" y1="-2.125" x2="2" y2="2.125" width="0.127" layer="20"/>
<wire x1="-0.889" y1="2.159" x2="0.889" y2="2.159" width="0.2032" layer="21"/>
<wire x1="-2.032" y1="-0.127" x2="-2.032" y2="-2.159" width="0.2032" layer="21"/>
<wire x1="-2.032" y1="-2.159" x2="-1.143" y2="-2.159" width="0.2032" layer="21"/>
<wire x1="2.032" y1="-0.127" x2="2.032" y2="-2.159" width="0.2032" layer="21"/>
<wire x1="2.032" y1="-2.159" x2="1.143" y2="-2.159" width="0.2032" layer="21"/>
<smd name="NC2" x="1.8" y="1.125" dx="1.2" dy="2" layer="1" rot="R180"/>
<smd name="NC1" x="-1.8" y="1.125" dx="1.2" dy="2" layer="1" rot="R180"/>
<smd name="2" x="0.5" y="-2.55" dx="1.35" dy="0.5" layer="1" rot="R270"/>
<smd name="1" x="-0.5" y="-2.55" dx="1.35" dy="0.5" layer="1" rot="R270"/>
<text x="-1.063" y="-2.404" size="1.4224" layer="21" ratio="12" rot="R180">-</text>
<text x="2.683" y="-2.404" size="1.4224" layer="21" ratio="12" rot="R180">+</text>
<text x="2.794" y="1.397" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="2.794" y="0.635" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="JSTPH2_NOTHERMALS">
<wire x1="-4" y1="3" x2="4" y2="3" width="0.2032" layer="51"/>
<wire x1="4" y1="3" x2="4" y2="-4.5" width="0.2032" layer="51"/>
<wire x1="-4" y1="-4.5" x2="-4" y2="3" width="0.2032" layer="51"/>
<wire x1="3.2" y1="-2" x2="-3.2" y2="-2" width="0.2032" layer="51"/>
<wire x1="-3.2" y1="-2" x2="-3.2" y2="-4.5" width="0.2032" layer="51"/>
<wire x1="-3.2" y1="-4.5" x2="-4" y2="-4.5" width="0.2032" layer="51"/>
<wire x1="4" y1="-4.5" x2="3.2" y2="-4.5" width="0.2032" layer="51"/>
<wire x1="3.2" y1="-4.5" x2="3.2" y2="-2" width="0.2032" layer="51"/>
<wire x1="-2.25" y1="3" x2="2.25" y2="3" width="0.2032" layer="21"/>
<wire x1="4" y1="-0.5" x2="4" y2="-4.5" width="0.2032" layer="21"/>
<wire x1="4" y1="-4.5" x2="3.15" y2="-4.5" width="0.2032" layer="21"/>
<wire x1="3.15" y1="-4.5" x2="3.15" y2="-2" width="0.2032" layer="21"/>
<wire x1="3.15" y1="-2" x2="1.75" y2="-2" width="0.2032" layer="21"/>
<wire x1="-1.75" y1="-2" x2="-3.15" y2="-2" width="0.2032" layer="21"/>
<wire x1="-3.15" y1="-2" x2="-3.15" y2="-4.5" width="0.2032" layer="21"/>
<wire x1="-3.15" y1="-4.5" x2="-4" y2="-4.5" width="0.2032" layer="21"/>
<wire x1="-4" y1="-4.5" x2="-4" y2="-0.5" width="0.2032" layer="21"/>
<smd name="1" x="-1" y="-3.7" dx="1" dy="4.6" layer="1" thermals="no"/>
<smd name="2" x="1" y="-3.7" dx="1" dy="4.6" layer="1" thermals="no"/>
<smd name="NC1" x="-3.4" y="1.5" dx="3.4" dy="1.6" layer="1" rot="R90"/>
<smd name="NC2" x="3.4" y="1.5" dx="3.4" dy="1.6" layer="1" rot="R90"/>
<text x="-2.2225" y="1.9685" size="0.8128" layer="25" ratio="18">&gt;Name</text>
<text x="-2.2225" y="1.27" size="0.4064" layer="27" ratio="10">&gt;Value</text>
</package>
<package name="CHIPLED_1206">
<description>&lt;b&gt;CHIPLED 1206&lt;/b&gt;</description>
<wire x1="-0.4" y1="1.6" x2="0.4" y2="1.6" width="0.1016" layer="51" curve="172.619069"/>
<wire x1="-0.8" y1="-0.95" x2="-0.8" y2="0.95" width="0.1016" layer="51"/>
<wire x1="0.8" y1="0.95" x2="0.8" y2="-0.95" width="0.1016" layer="51"/>
<wire x1="-0.6" y1="0.446" x2="0" y2="0.446" width="0.2032" layer="21"/>
<wire x1="0" y1="0.446" x2="0.6" y2="0.446" width="0.2032" layer="21"/>
<wire x1="0" y1="0.446" x2="-0.6" y2="-0.154" width="0.2032" layer="21"/>
<wire x1="-0.6" y1="-0.154" x2="0.6" y2="-0.154" width="0.2032" layer="21"/>
<wire x1="0.6" y1="-0.154" x2="0" y2="0.446" width="0.2032" layer="21"/>
<wire x1="1" y1="2.4985" x2="-1" y2="2.4985" width="0.2032" layer="21"/>
<wire x1="-1" y1="2.4985" x2="-1" y2="-2.4985" width="0.2032" layer="21"/>
<wire x1="-1" y1="-2.4985" x2="1" y2="-2.4985" width="0.2032" layer="21"/>
<wire x1="1" y1="-2.4985" x2="1" y2="2.4985" width="0.2032" layer="21"/>
<circle x="-0.55" y="1.425" radius="0.1" width="0.0762" layer="51"/>
<smd name="C" x="0" y="1.496" dx="1.5" dy="1.5" layer="1"/>
<smd name="A" x="0" y="-1.496" dx="1.5" dy="1.5" layer="1"/>
<text x="-1.27" y="-2.286" size="0.8128" layer="25" ratio="18" rot="R90">&gt;NAME</text>
<text x="1.651" y="-2.286" size="0.4064" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<text x="-0.1" y="-2.23" size="0.4064" layer="51">A</text>
<text x="-0.1" y="1.86" size="0.4064" layer="51">C</text>
<rectangle x1="-0.85" y1="1.525" x2="-0.35" y2="1.65" layer="51"/>
<rectangle x1="-0.85" y1="1.225" x2="-0.625" y2="1.55" layer="51"/>
<rectangle x1="-0.45" y1="1.225" x2="-0.325" y2="1.45" layer="51"/>
<rectangle x1="-0.65" y1="1.225" x2="-0.225" y2="1.35" layer="51"/>
<rectangle x1="0.35" y1="1.3" x2="0.85" y2="1.65" layer="51"/>
<rectangle x1="0.25" y1="1.225" x2="0.85" y2="1.35" layer="51"/>
<rectangle x1="-0.85" y1="0.95" x2="0.85" y2="1.25" layer="51"/>
<rectangle x1="-0.85" y1="-1.65" x2="0.85" y2="-0.95" layer="51"/>
</package>
<package name="CHIPLED_0805">
<description>&lt;b&gt;CHIPLED 0805&lt;/b&gt;</description>
<wire x1="-0.35" y1="0.925" x2="0.35" y2="0.925" width="0.1016" layer="51" curve="162.394521"/>
<wire x1="-0.35" y1="-0.925" x2="0.35" y2="-0.925" width="0.1016" layer="51" curve="-162.394521"/>
<wire x1="0.575" y1="0.525" x2="0.575" y2="-0.525" width="0.1016" layer="51"/>
<wire x1="-0.575" y1="-0.5" x2="-0.575" y2="0.925" width="0.1016" layer="51"/>
<wire x1="-0.4" y1="0.2" x2="0" y2="0.2" width="0.2032" layer="21"/>
<wire x1="0" y1="0.2" x2="0.4" y2="0.2" width="0.2032" layer="21"/>
<wire x1="0" y1="0.2" x2="-0.4" y2="-0.2" width="0.2032" layer="21"/>
<wire x1="-0.4" y1="-0.2" x2="0.4" y2="-0.2" width="0.2032" layer="21"/>
<wire x1="0.4" y1="-0.2" x2="0" y2="0.2" width="0.2032" layer="21"/>
<wire x1="0.85" y1="-1.9" x2="-0.85" y2="-1.9" width="0.2032" layer="21"/>
<wire x1="-0.85" y1="-1.9" x2="-0.85" y2="1.9" width="0.2032" layer="21"/>
<wire x1="-0.85" y1="1.9" x2="0.85" y2="1.9" width="0.2032" layer="21"/>
<wire x1="0.85" y1="1.9" x2="0.85" y2="-1.9" width="0.2032" layer="21"/>
<circle x="-0.45" y="0.85" radius="0.103" width="0.0762" layer="51"/>
<smd name="C" x="0" y="1.05" dx="1.2" dy="1.2" layer="1"/>
<smd name="A" x="0" y="-1.05" dx="1.2" dy="1.2" layer="1"/>
<text x="-1.016" y="-1.778" size="0.8128" layer="25" ratio="18" rot="R90">&gt;NAME</text>
<text x="1.397" y="-1.778" size="0.4064" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<text x="-0.1" y="-1.4" size="0.254" layer="51">A</text>
<text x="-0.1" y="1.2" size="0.254" layer="51">C</text>
<rectangle x1="0.3" y1="0.5" x2="0.625" y2="1" layer="51"/>
<rectangle x1="-0.325" y1="0.5" x2="-0.175" y2="0.75" layer="51"/>
<rectangle x1="0.175" y1="0.5" x2="0.325" y2="0.75" layer="51"/>
<rectangle x1="-0.2" y1="0.5" x2="0.2" y2="0.675" layer="51"/>
<rectangle x1="0.3" y1="-1" x2="0.625" y2="-0.5" layer="51"/>
<rectangle x1="-0.625" y1="-1" x2="-0.3" y2="-0.5" layer="51"/>
<rectangle x1="0.175" y1="-0.75" x2="0.325" y2="-0.5" layer="51"/>
<rectangle x1="-0.325" y1="-0.75" x2="-0.175" y2="-0.5" layer="51"/>
<rectangle x1="-0.2" y1="-0.675" x2="0.2" y2="-0.5" layer="51"/>
<rectangle x1="-0.6" y1="0.5" x2="-0.3" y2="0.762" layer="51"/>
<rectangle x1="-0.625" y1="0.925" x2="-0.3" y2="1" layer="51"/>
</package>
<package name="CHIPLED_0603">
<description>&lt;b&gt;CHIPLED 0603&lt;/b&gt;</description>
<wire x1="-0.3" y1="0.8" x2="0.3" y2="0.8" width="0.1016" layer="51" curve="170.055574"/>
<wire x1="-0.275" y1="-0.825" x2="0.275" y2="-0.825" width="0.0508" layer="51" curve="-180"/>
<wire x1="-0.4" y1="0.375" x2="-0.4" y2="-0.35" width="0.1016" layer="51"/>
<wire x1="0.4" y1="0.35" x2="0.4" y2="-0.35" width="0.1016" layer="51"/>
<wire x1="-0.65" y1="-1.4" x2="-0.65" y2="1.4" width="0.2032" layer="21"/>
<wire x1="0.65" y1="1.4" x2="0.65" y2="-1.4" width="0.2032" layer="21"/>
<wire x1="-0.65" y1="1.4" x2="0.65" y2="1.4" width="0.2032" layer="21"/>
<wire x1="-0.65" y1="-1.4" x2="0.65" y2="-1.4" width="0.2032" layer="21"/>
<wire x1="-0.4" y1="0.2" x2="0" y2="0.2" width="0.2032" layer="21"/>
<wire x1="0" y1="0.2" x2="0.4" y2="0.2" width="0.2032" layer="21"/>
<wire x1="0" y1="0.2" x2="-0.4" y2="-0.2" width="0.2032" layer="21"/>
<wire x1="-0.4" y1="-0.2" x2="0.4" y2="-0.2" width="0.2032" layer="21"/>
<wire x1="0.4" y1="-0.2" x2="0" y2="0.2" width="0.2032" layer="21"/>
<circle x="-0.35" y="0.625" radius="0.075" width="0.0508" layer="51"/>
<smd name="C" x="0" y="0.75" dx="0.8" dy="0.8" layer="1"/>
<smd name="A" x="0" y="-0.75" dx="0.8" dy="0.8" layer="1"/>
<text x="-0.762" y="-1.27" size="0.8128" layer="25" ratio="18" rot="R90">&gt;NAME</text>
<text x="1.27" y="-1.27" size="0.4064" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<rectangle x1="-0.45" y1="0.7" x2="-0.25" y2="0.85" layer="51"/>
<rectangle x1="-0.275" y1="0.55" x2="-0.225" y2="0.6" layer="51"/>
<rectangle x1="-0.45" y1="0.35" x2="-0.4" y2="0.725" layer="51"/>
<rectangle x1="0.25" y1="0.55" x2="0.45" y2="0.85" layer="51"/>
<rectangle x1="-0.45" y1="0.35" x2="0.45" y2="0.575" layer="51"/>
<rectangle x1="-0.45" y1="-0.85" x2="-0.25" y2="-0.35" layer="51"/>
<rectangle x1="0.25" y1="-0.85" x2="0.45" y2="-0.35" layer="51"/>
<rectangle x1="-0.275" y1="-0.575" x2="0.275" y2="-0.35" layer="51"/>
<rectangle x1="-0.275" y1="-0.65" x2="-0.175" y2="-0.55" layer="51"/>
<rectangle x1="0.175" y1="-0.65" x2="0.275" y2="-0.55" layer="51"/>
</package>
<package name="CHIPLED_0603_NOOUTLINE">
<wire x1="-0.3" y1="0.8" x2="0.3" y2="0.8" width="0.1016" layer="51" curve="170.055574"/>
<wire x1="-0.275" y1="-0.825" x2="0.275" y2="-0.825" width="0.0508" layer="51" curve="-180"/>
<wire x1="-0.4" y1="0.375" x2="-0.4" y2="-0.35" width="0.1016" layer="51"/>
<wire x1="0.4" y1="0.35" x2="0.4" y2="-0.35" width="0.1016" layer="51"/>
<circle x="-0.35" y="0.625" radius="0.075" width="0.0508" layer="51"/>
<smd name="C" x="0" y="0.75" dx="0.8" dy="0.8" layer="1"/>
<smd name="A" x="0" y="-0.75" dx="0.8" dy="0.8" layer="1"/>
<text x="-0.762" y="-1.27" size="0.8128" layer="25" ratio="18" rot="R90">&gt;NAME</text>
<text x="1.27" y="-1.27" size="0.4064" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<rectangle x1="-0.45" y1="0.7" x2="-0.25" y2="0.85" layer="51"/>
<rectangle x1="-0.275" y1="0.55" x2="-0.225" y2="0.6" layer="51"/>
<rectangle x1="-0.45" y1="0.35" x2="-0.4" y2="0.725" layer="51"/>
<rectangle x1="0.25" y1="0.55" x2="0.45" y2="0.85" layer="51"/>
<rectangle x1="-0.45" y1="0.35" x2="0.45" y2="0.575" layer="51"/>
<rectangle x1="-0.45" y1="-0.85" x2="-0.25" y2="-0.35" layer="51"/>
<rectangle x1="0.25" y1="-0.85" x2="0.45" y2="-0.35" layer="51"/>
<rectangle x1="-0.275" y1="-0.575" x2="0.275" y2="-0.35" layer="51"/>
<rectangle x1="-0.275" y1="-0.65" x2="-0.175" y2="-0.55" layer="51"/>
<rectangle x1="0.175" y1="-0.65" x2="0.275" y2="-0.55" layer="51"/>
<rectangle x1="-0.381" y1="0.1397" x2="0.381" y2="0.2667" layer="21"/>
<polygon width="0.1524" layer="21">
<vertex x="0" y="0.1397"/>
<vertex x="-0.254" y="-0.1778"/>
<vertex x="0.254" y="-0.1778"/>
</polygon>
</package>
<package name="CHIPLED_0805_NOOUTLINE">
<wire x1="-0.35" y1="0.925" x2="0.35" y2="0.925" width="0.1016" layer="51" curve="162.394521"/>
<wire x1="-0.35" y1="-0.925" x2="0.35" y2="-0.925" width="0.1016" layer="51" curve="-162.394521"/>
<wire x1="0.575" y1="0.525" x2="0.575" y2="-0.525" width="0.1016" layer="51"/>
<wire x1="-0.575" y1="-0.5" x2="-0.575" y2="0.925" width="0.1016" layer="51"/>
<circle x="-0.45" y="0.85" radius="0.103" width="0.0762" layer="51"/>
<smd name="C" x="0" y="1.05" dx="1.2" dy="1.2" layer="1"/>
<smd name="A" x="0" y="-1.05" dx="1.2" dy="1.2" layer="1"/>
<text x="-1.016" y="-1.778" size="0.8128" layer="25" ratio="18" rot="R90">&gt;NAME</text>
<text x="1.397" y="-1.778" size="0.4064" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<text x="-0.1" y="-1.4" size="0.254" layer="51">A</text>
<text x="-0.1" y="1.2" size="0.254" layer="51">C</text>
<rectangle x1="0.3" y1="0.5" x2="0.625" y2="1" layer="51"/>
<rectangle x1="-0.325" y1="0.5" x2="-0.175" y2="0.75" layer="51"/>
<rectangle x1="0.175" y1="0.5" x2="0.325" y2="0.75" layer="51"/>
<rectangle x1="-0.2" y1="0.5" x2="0.2" y2="0.675" layer="51"/>
<rectangle x1="0.3" y1="-1" x2="0.625" y2="-0.5" layer="51"/>
<rectangle x1="-0.625" y1="-1" x2="-0.3" y2="-0.5" layer="51"/>
<rectangle x1="0.175" y1="-0.75" x2="0.325" y2="-0.5" layer="51"/>
<rectangle x1="-0.325" y1="-0.75" x2="-0.175" y2="-0.5" layer="51"/>
<rectangle x1="-0.2" y1="-0.675" x2="0.2" y2="-0.5" layer="51"/>
<rectangle x1="-0.6" y1="0.5" x2="-0.3" y2="0.762" layer="51"/>
<rectangle x1="-0.625" y1="0.925" x2="-0.3" y2="1" layer="51"/>
<rectangle x1="-0.4445" y1="0.1405" x2="0.4445" y2="0.331" layer="21"/>
<polygon width="0.1524" layer="21">
<vertex x="0" y="0.254"/>
<vertex x="-0.381" y="-0.254"/>
<vertex x="0.381" y="-0.254"/>
</polygon>
</package>
<package name="CREE_XLAMP_XPE2">
<description>&lt;p&gt;Source: http://www.cree.com/~/media/Files/Cree/LED%20Components%20and%20Modules/XLamp/Data%20and%20Binning/XLampXPE2.pdf&lt;/p&gt;</description>
<smd name="CATHODE" x="-1.4" y="0" dx="0.5" dy="3.3" layer="1" cream="no"/>
<smd name="ANODE" x="1.4" y="0" dx="0.5" dy="3.3" layer="1" cream="no"/>
<smd name="THERMAL" x="0" y="0" dx="1.3" dy="3.3" layer="1" cream="no"/>
<rectangle x1="-2.05" y1="-0.25" x2="-1.15" y2="0.25" layer="1"/>
<rectangle x1="-2.1" y1="-0.3" x2="-1.15" y2="0.3" layer="29"/>
<rectangle x1="1.15" y1="-0.25" x2="2.05" y2="0.25" layer="1" rot="R180"/>
<rectangle x1="1.15" y1="-0.3" x2="2.1" y2="0.3" layer="29" rot="R180"/>
<rectangle x1="-0.6" y1="-1.6" x2="0.6" y2="1.6" layer="31"/>
<rectangle x1="-2" y1="-0.2" x2="-1.2" y2="0.2" layer="31"/>
<rectangle x1="-1.6" y1="0.2" x2="-1.2" y2="1.6" layer="31"/>
<rectangle x1="-1.6" y1="-1.6" x2="-1.2" y2="-0.2" layer="31"/>
<rectangle x1="1.2" y1="-0.2" x2="2" y2="0.2" layer="31"/>
<rectangle x1="1.2" y1="0.2" x2="1.6" y2="1.6" layer="31"/>
<rectangle x1="1.2" y1="-1.6" x2="1.6" y2="-0.2" layer="31"/>
<wire x1="-1.725" y1="1.725" x2="1.725" y2="1.725" width="0.127" layer="51"/>
<wire x1="1.725" y1="1.725" x2="1.725" y2="-1.725" width="0.127" layer="51"/>
<wire x1="1.725" y1="-1.725" x2="-1.725" y2="-1.725" width="0.127" layer="51"/>
<wire x1="-1.725" y1="-1.725" x2="-1.725" y2="1.725" width="0.127" layer="51"/>
<circle x="0" y="0" radius="1.48660625" width="0.127" layer="51"/>
<rectangle x1="-1.5" y1="-1.5" x2="-1.3" y2="-1.3" layer="51"/>
<wire x1="-0.6" y1="-1.7" x2="-0.6" y2="-0.7" width="0.127" layer="51"/>
<wire x1="-0.6" y1="-0.7" x2="0.7" y2="-0.7" width="0.127" layer="51"/>
<wire x1="0.7" y1="-0.7" x2="0.7" y2="0.7" width="0.127" layer="51"/>
<wire x1="0.7" y1="0.7" x2="0" y2="0.7" width="0.127" layer="51"/>
<wire x1="0" y1="0.7" x2="0" y2="1.7" width="0.127" layer="51"/>
<polygon width="0.1524" layer="21">
<vertex x="2.346" y="1.2"/>
<vertex x="2.954" y="0.719"/>
<vertex x="2.954" y="1.681"/>
</polygon>
<rectangle x1="2.1" y1="0.6" x2="2.4" y2="1.8" layer="21"/>
<wire x1="-1.8" y1="1.8" x2="1.8" y2="1.8" width="0.127" layer="21"/>
<wire x1="1.8" y1="1.8" x2="1.8" y2="0.4" width="0.127" layer="21"/>
<wire x1="-1.8" y1="1.8" x2="-1.8" y2="0.4" width="0.127" layer="21"/>
<wire x1="-1.8" y1="-0.4" x2="-1.8" y2="-1.8" width="0.127" layer="21"/>
<wire x1="-1.8" y1="-1.8" x2="1.8" y2="-1.8" width="0.127" layer="21"/>
<wire x1="1.8" y1="-1.8" x2="1.8" y2="-0.4" width="0.127" layer="21"/>
<text x="-1.862" y="2.027" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-1.762" y="-2.435" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-0.5" y1="-0.5" x2="0.5" y2="0.5" layer="51"/>
</package>
<package name="CREE_XLAMP_XTE">
<smd name="CATHODE" x="-1.4" y="0" dx="0.5" dy="3.3" layer="1" cream="no"/>
<smd name="ANODE" x="1.4" y="0" dx="0.5" dy="3.3" layer="1" cream="no"/>
<smd name="THERMAL" x="0" y="0" dx="1.3" dy="3.3" layer="1" cream="no"/>
<rectangle x1="-2.05" y1="-0.25" x2="-1.15" y2="0.25" layer="1"/>
<rectangle x1="-2.1" y1="-0.3" x2="-1.15" y2="0.3" layer="29"/>
<rectangle x1="1.15" y1="-0.25" x2="2.05" y2="0.25" layer="1" rot="R180"/>
<rectangle x1="1.15" y1="-0.3" x2="2.1" y2="0.3" layer="29" rot="R180"/>
<rectangle x1="-0.6" y1="-1.6" x2="0.6" y2="1.6" layer="31"/>
<rectangle x1="-2" y1="-0.2" x2="-1.2" y2="0.2" layer="31"/>
<rectangle x1="-1.6" y1="0.2" x2="-1.2" y2="1.6" layer="31"/>
<rectangle x1="-1.6" y1="-1.6" x2="-1.2" y2="-0.2" layer="31"/>
<rectangle x1="1.2" y1="-0.2" x2="2" y2="0.2" layer="31"/>
<rectangle x1="1.2" y1="0.2" x2="1.6" y2="1.6" layer="31"/>
<rectangle x1="1.2" y1="-1.6" x2="1.6" y2="-0.2" layer="31"/>
<wire x1="-1.725" y1="1.725" x2="1.725" y2="1.725" width="0.127" layer="51"/>
<wire x1="1.725" y1="1.725" x2="1.725" y2="-1.725" width="0.127" layer="51"/>
<wire x1="1.725" y1="-1.725" x2="-1.725" y2="-1.725" width="0.127" layer="51"/>
<wire x1="-1.725" y1="-1.725" x2="-1.725" y2="1.725" width="0.127" layer="51"/>
<rectangle x1="-1.5" y1="-1.5" x2="-1.3" y2="-1.3" layer="51"/>
<polygon width="0.1524" layer="21">
<vertex x="2.346" y="1.2"/>
<vertex x="2.954" y="0.719"/>
<vertex x="2.954" y="1.681"/>
</polygon>
<rectangle x1="2.1" y1="0.6" x2="2.4" y2="1.8" layer="21"/>
<wire x1="-1.8" y1="1.8" x2="1.8" y2="1.8" width="0.127" layer="21"/>
<wire x1="1.8" y1="1.8" x2="1.8" y2="0.4" width="0.127" layer="21"/>
<wire x1="-1.8" y1="1.8" x2="-1.8" y2="0.4" width="0.127" layer="21"/>
<wire x1="-1.8" y1="-0.4" x2="-1.8" y2="-1.8" width="0.127" layer="21"/>
<wire x1="-1.8" y1="-1.8" x2="1.8" y2="-1.8" width="0.127" layer="21"/>
<wire x1="1.8" y1="-1.8" x2="1.8" y2="-0.4" width="0.127" layer="21"/>
<text x="-1.862" y="2.027" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-1.762" y="-2.435" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-0.5" y1="-0.5" x2="0.5" y2="0.5" layer="51"/>
<circle x="0" y="0" radius="1.5811375" width="0.127" layer="51"/>
<circle x="0" y="0" radius="1.3928375" width="0.127" layer="51"/>
<wire x1="1.2" y1="0.125" x2="1.45" y2="0.125" width="0.1" layer="51"/>
<wire x1="1.45" y1="0.125" x2="1.45" y2="0.375" width="0.1" layer="51"/>
<wire x1="1.45" y1="0.375" x2="1.7" y2="0.375" width="0.1" layer="51"/>
<wire x1="1.7" y1="0.375" x2="1.7" y2="0.125" width="0.1" layer="51"/>
<wire x1="1.7" y1="0.125" x2="1.95" y2="0.125" width="0.1" layer="51"/>
<wire x1="1.95" y1="0.125" x2="1.95" y2="-0.125" width="0.1" layer="51"/>
<wire x1="1.95" y1="-0.125" x2="1.7" y2="-0.125" width="0.1" layer="51"/>
<wire x1="1.7" y1="-0.125" x2="1.7" y2="-0.375" width="0.1" layer="51"/>
<wire x1="1.7" y1="-0.375" x2="1.45" y2="-0.375" width="0.1" layer="51"/>
<wire x1="1.45" y1="-0.375" x2="1.45" y2="-0.125" width="0.1" layer="51"/>
<wire x1="1.45" y1="-0.125" x2="1.2" y2="-0.125" width="0.1" layer="51"/>
<wire x1="1.2" y1="-0.125" x2="1.2" y2="0.125" width="0.1" layer="51"/>
</package>
<package name="EVERLIGHT_45-21">
<wire x1="-1.35" y1="1" x2="1.35" y2="1" width="0.127" layer="51"/>
<wire x1="1.35" y1="1" x2="1.35" y2="0.7" width="0.127" layer="51"/>
<wire x1="1.35" y1="0.7" x2="1.35" y2="-0.55" width="0.127" layer="51"/>
<wire x1="1.35" y1="-0.55" x2="1.35" y2="-0.7" width="0.127" layer="51"/>
<wire x1="1.35" y1="-0.7" x2="1.35" y2="-1" width="0.127" layer="51"/>
<wire x1="1.35" y1="-1" x2="0.9" y2="-1" width="0.127" layer="51"/>
<wire x1="0.9" y1="-1" x2="-1.35" y2="-1" width="0.127" layer="51"/>
<wire x1="-1.35" y1="-1" x2="-1.35" y2="-0.7" width="0.127" layer="51"/>
<wire x1="-1.35" y1="-0.7" x2="-1.35" y2="0.7" width="0.127" layer="51"/>
<wire x1="-1.35" y1="0.7" x2="-1.35" y2="1" width="0.127" layer="51"/>
<wire x1="1.35" y1="0.7" x2="1.5" y2="0.7" width="0.127" layer="51"/>
<wire x1="1.5" y1="0.7" x2="1.5" y2="-0.7" width="0.127" layer="51"/>
<wire x1="1.5" y1="-0.7" x2="1.35" y2="-0.7" width="0.127" layer="51"/>
<wire x1="1.35" y1="-0.7" x2="1.35" y2="-0.55" width="0.127" layer="51"/>
<wire x1="1.35" y1="-0.55" x2="1.35" y2="0.7" width="0.127" layer="51"/>
<wire x1="-1.35" y1="0.7" x2="-1.5" y2="0.7" width="0.127" layer="51"/>
<wire x1="-1.5" y1="0.7" x2="-1.5" y2="-0.7" width="0.127" layer="51"/>
<wire x1="-1.5" y1="-0.7" x2="-1.35" y2="-0.7" width="0.127" layer="51"/>
<wire x1="-1.15" y1="0.45" x2="-1.15" y2="0.5" width="0.127" layer="51"/>
<wire x1="-1.15" y1="0.5" x2="-0.85" y2="0.8" width="0.127" layer="51" curve="-90"/>
<wire x1="-0.85" y1="0.8" x2="0.8" y2="0.8" width="0.127" layer="51"/>
<wire x1="0.8" y1="0.8" x2="1.15" y2="0.45" width="0.127" layer="51" curve="-90"/>
<wire x1="1.15" y1="0.45" x2="1.15" y2="-0.5" width="0.127" layer="51"/>
<wire x1="1.15" y1="-0.5" x2="0.85" y2="-0.8" width="0.127" layer="51" curve="-90"/>
<wire x1="0.85" y1="-0.8" x2="-0.85" y2="-0.8" width="0.127" layer="51"/>
<wire x1="-0.85" y1="-0.8" x2="-1.15" y2="-0.5" width="0.127" layer="51" curve="-90"/>
<wire x1="-1.15" y1="-0.5" x2="-1.15" y2="0.45" width="0.127" layer="51"/>
<smd name="A" x="-1.45" y="0" dx="1.4" dy="1.4" layer="1"/>
<smd name="K" x="1.45" y="0" dx="1.4" dy="1.4" layer="1"/>
<wire x1="0.9" y1="-1" x2="1.35" y2="-0.55" width="0.127" layer="51"/>
<wire x1="1.35" y1="-0.55" x2="1.35" y2="-0.7" width="0.127" layer="51"/>
<wire x1="1.35" y1="-0.7" x2="1.1" y2="-0.95" width="0.127" layer="51"/>
<wire x1="1.1" y1="-0.95" x2="1.2" y2="-0.95" width="0.127" layer="51"/>
<wire x1="1.2" y1="-0.95" x2="1.3" y2="-0.85" width="0.127" layer="51"/>
<text x="-1.375" y="1.25" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-1.375" y="-1.633" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<wire x1="-1.45" y1="0.85" x2="-1.45" y2="1.1" width="0.127" layer="21"/>
<wire x1="-1.45" y1="1.1" x2="1.45" y2="1.1" width="0.127" layer="21"/>
<wire x1="1.45" y1="1.1" x2="1.45" y2="0.9" width="0.127" layer="21"/>
<wire x1="1.45" y1="0.9" x2="1.45" y2="0.85" width="0.127" layer="21"/>
<wire x1="-1.45" y1="-0.85" x2="-1.45" y2="-1.1" width="0.127" layer="21"/>
<wire x1="-1.45" y1="-1.1" x2="1.45" y2="-1.1" width="0.127" layer="21"/>
<wire x1="1.45" y1="-1.1" x2="1.45" y2="-0.85" width="0.127" layer="21"/>
<polygon width="0.1524" layer="21">
<vertex x="0.254" y="0"/>
<vertex x="-0.354" y="0.481"/>
<vertex x="-0.354" y="-0.481"/>
</polygon>
<rectangle x1="0.2" y1="-0.6" x2="0.5" y2="0.6" layer="21" rot="R180"/>
</package>
<package name="PLCC2_REVMOUNT">
<description>&lt;p&gt;PLCC2 - Reverse Mount&lt;/p&gt;
&lt;p&gt;Source: http://catalog.osram-os.com/media/_en/Graphics/00042122_0.pdf&lt;/p&gt;</description>
<smd name="K" x="-2.4" y="0" dx="1.2" dy="2.6" layer="1"/>
<smd name="A" x="2.4" y="0" dx="1.2" dy="2.6" layer="1"/>
<hole x="0" y="0" drill="2.5"/>
<wire x1="-1.7" y1="1.15" x2="-1.7" y2="1.3" width="0.127" layer="51"/>
<wire x1="-1.7" y1="1.3" x2="-1.5" y2="1.5" width="0.127" layer="51" curve="-90"/>
<wire x1="-1.5" y1="1.5" x2="-0.95" y2="1.5" width="0.127" layer="51"/>
<wire x1="-0.95" y1="1.5" x2="1.5" y2="1.5" width="0.127" layer="51"/>
<wire x1="1.5" y1="1.5" x2="1.7" y2="1.3" width="0.127" layer="51" curve="-90"/>
<wire x1="1.7" y1="1.3" x2="1.7" y2="1.2" width="0.127" layer="51"/>
<wire x1="1.7" y1="1.2" x2="1.7" y2="1.15" width="0.127" layer="51"/>
<wire x1="1.7" y1="1.15" x2="2.7" y2="1.15" width="0.127" layer="51"/>
<wire x1="2.7" y1="1.15" x2="2.7" y2="-1.15" width="0.127" layer="51"/>
<wire x1="2.7" y1="-1.15" x2="1.7" y2="-1.15" width="0.127" layer="51"/>
<wire x1="1.7" y1="-1.15" x2="1.7" y2="-1.2" width="0.127" layer="51"/>
<wire x1="1.7" y1="-1.2" x2="1.7" y2="-1.25" width="0.127" layer="51"/>
<wire x1="1.7" y1="-1.25" x2="1.45" y2="-1.5" width="0.127" layer="51" curve="-90"/>
<wire x1="1.45" y1="-1.5" x2="-1.45" y2="-1.5" width="0.127" layer="51"/>
<wire x1="-1.45" y1="-1.5" x2="-1.7" y2="-1.25" width="0.127" layer="51" curve="-90"/>
<wire x1="-1.7" y1="-1.25" x2="-1.7" y2="-1.15" width="0.127" layer="51"/>
<wire x1="-1.7" y1="-1.15" x2="-2.65" y2="-1.15" width="0.127" layer="51"/>
<wire x1="-2.65" y1="-1.15" x2="-2.65" y2="1.15" width="0.127" layer="51"/>
<wire x1="-2.65" y1="1.15" x2="-1.7" y2="1.15" width="0.127" layer="51"/>
<wire x1="-1.7" y1="1.15" x2="-1.7" y2="0.75" width="0.127" layer="51"/>
<wire x1="-1.7" y1="0.75" x2="-1.7" y2="0.65" width="0.127" layer="51"/>
<wire x1="-1.7" y1="0.65" x2="-1.7" y2="-0.65" width="0.127" layer="51"/>
<wire x1="-1.7" y1="-0.65" x2="-1.7" y2="-1.15" width="0.127" layer="51"/>
<wire x1="-1.7" y1="-0.65" x2="-1.75" y2="-0.65" width="0.127" layer="51"/>
<wire x1="-1.75" y1="-0.65" x2="-1.85" y2="-0.55" width="0.127" layer="51" curve="-90"/>
<wire x1="-1.85" y1="-0.55" x2="-1.85" y2="0.5" width="0.127" layer="51"/>
<wire x1="-1.85" y1="0.5" x2="-1.7" y2="0.65" width="0.127" layer="51" curve="-90"/>
<wire x1="1.7" y1="-1.2" x2="1.7" y2="-0.65" width="0.127" layer="51"/>
<wire x1="1.7" y1="-0.65" x2="1.7" y2="0.65" width="0.127" layer="51"/>
<wire x1="1.7" y1="0.65" x2="1.7" y2="1.2" width="0.127" layer="51"/>
<wire x1="1.7" y1="0.65" x2="1.75" y2="0.65" width="0.127" layer="51"/>
<wire x1="1.75" y1="0.65" x2="1.85" y2="0.55" width="0.127" layer="51" curve="-90"/>
<wire x1="1.85" y1="0.55" x2="1.85" y2="-0.5" width="0.127" layer="51"/>
<wire x1="1.85" y1="-0.5" x2="1.7" y2="-0.65" width="0.127" layer="51" curve="-90"/>
<wire x1="-1.7" y1="0.75" x2="-0.95" y2="1.5" width="0.127" layer="51"/>
<circle x="0" y="0" radius="1.220653125" width="0.127" layer="51"/>
<wire x1="0" y1="0.8" x2="0.8" y2="0" width="0.127" layer="51" style="shortdash" curve="-90"/>
<wire x1="0.8" y1="0" x2="0" y2="-0.8" width="0.127" layer="51" style="shortdash" curve="-90"/>
<wire x1="0" y1="-0.8" x2="-0.8" y2="0" width="0.127" layer="51" style="shortdash" curve="-90"/>
<wire x1="-0.8" y1="0" x2="0" y2="0.8" width="0.127" layer="51" style="shortdash" curve="-90"/>
<wire x1="-1.75" y1="1.45" x2="-1.6" y2="1.6" width="0.127" layer="21" curve="-90"/>
<wire x1="-1.6" y1="1.6" x2="1.6" y2="1.6" width="0.127" layer="21"/>
<wire x1="1.6" y1="1.6" x2="1.75" y2="1.45" width="0.127" layer="21" curve="-90"/>
<wire x1="-1.75" y1="-1.45" x2="-1.55" y2="-1.6" width="0.127" layer="21" curve="90"/>
<wire x1="-1.55" y1="-1.6" x2="1.55" y2="-1.6" width="0.127" layer="21"/>
<wire x1="1.55" y1="-1.6" x2="1.75" y2="-1.45" width="0.127" layer="21" curve="90"/>
<text x="-1.79" y="1.84" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-1.74" y="-2.16" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="CHIPLED_1206_NOOUTLINE">
<wire x1="-0.6" y1="0.446" x2="0" y2="0.446" width="0.2032" layer="21"/>
<wire x1="0" y1="0.446" x2="0.6" y2="0.446" width="0.2032" layer="21"/>
<wire x1="0" y1="0.446" x2="-0.6" y2="-0.154" width="0.2032" layer="21"/>
<wire x1="-0.6" y1="-0.154" x2="0.6" y2="-0.154" width="0.2032" layer="21"/>
<wire x1="0.6" y1="-0.154" x2="0" y2="0.446" width="0.2032" layer="21"/>
<smd name="C" x="0" y="1.496" dx="1.5" dy="1.5" layer="1"/>
<smd name="A" x="0" y="-1.496" dx="1.5" dy="1.5" layer="1"/>
<text x="-1.27" y="-2.286" size="0.8128" layer="25" ratio="18" rot="R90">&gt;NAME</text>
<text x="1.651" y="-2.286" size="0.4064" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
</package>
<package name="SOLDERJUMPER_CLOSEDWIRE">
<wire x1="1.397" y1="-1.016" x2="-1.397" y2="-1.016" width="0.2032" layer="21"/>
<wire x1="1.397" y1="1.016" x2="1.651" y2="0.762" width="0.2032" layer="21" curve="-90"/>
<wire x1="-1.651" y1="0.762" x2="-1.397" y2="1.016" width="0.2032" layer="21" curve="-90"/>
<wire x1="-1.651" y1="-0.762" x2="-1.397" y2="-1.016" width="0.2032" layer="21" curve="90"/>
<wire x1="1.397" y1="-1.016" x2="1.651" y2="-0.762" width="0.2032" layer="21" curve="90"/>
<wire x1="1.651" y1="-0.762" x2="1.651" y2="0.762" width="0.2032" layer="21"/>
<wire x1="-1.651" y1="-0.762" x2="-1.651" y2="0.762" width="0.2032" layer="21"/>
<wire x1="-1.397" y1="1.016" x2="1.397" y2="1.016" width="0.2032" layer="21"/>
<wire x1="1.016" y1="0" x2="1.524" y2="0" width="0.2032" layer="51"/>
<wire x1="-1.016" y1="0" x2="-1.524" y2="0" width="0.2032" layer="51"/>
<wire x1="-0.254" y1="-0.127" x2="-0.254" y2="0.127" width="1.27" layer="51" curve="-180" cap="flat"/>
<wire x1="0.254" y1="0.127" x2="0.254" y2="-0.127" width="1.27" layer="51" curve="-180" cap="flat"/>
<smd name="1" x="-0.762" y="0" dx="1.1684" dy="1.6002" layer="1" stop="no" cream="no"/>
<smd name="2" x="0.762" y="0" dx="1.1684" dy="1.6002" layer="1" stop="no" cream="no"/>
<smd name="WIRE" x="0" y="0" dx="0.635" dy="0.2032" layer="1" rot="R180" stop="no" cream="no"/>
<text x="-1.651" y="1.27" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-1.524" y="-1.651" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<polygon width="0.254" layer="29">
<vertex x="-1.27" y="0.762"/>
<vertex x="1.27" y="0.762"/>
<vertex x="1.27" y="-0.762"/>
<vertex x="-1.27" y="-0.762"/>
</polygon>
</package>
<package name="SOLDERJUMPER_CLOSEDPERM">
<wire x1="1.397" y1="-1.016" x2="-1.397" y2="-1.016" width="0.2032" layer="21"/>
<wire x1="1.397" y1="1.016" x2="1.651" y2="0.762" width="0.2032" layer="21" curve="-90"/>
<wire x1="-1.651" y1="0.762" x2="-1.397" y2="1.016" width="0.2032" layer="21" curve="-90"/>
<wire x1="-1.651" y1="-0.762" x2="-1.397" y2="-1.016" width="0.2032" layer="21" curve="90"/>
<wire x1="1.397" y1="-1.016" x2="1.651" y2="-0.762" width="0.2032" layer="21" curve="90"/>
<wire x1="-1.651" y1="-0.762" x2="-1.651" y2="0.762" width="0.2032" layer="21"/>
<wire x1="-1.397" y1="1.016" x2="1.397" y2="1.016" width="0.2032" layer="21"/>
<wire x1="1.016" y1="0" x2="1.524" y2="0" width="0.2032" layer="51"/>
<wire x1="-1.016" y1="0" x2="-1.524" y2="0" width="0.2032" layer="51"/>
<wire x1="-0.254" y1="-0.127" x2="-0.254" y2="0.127" width="1.27" layer="51" curve="-180" cap="flat"/>
<wire x1="0.254" y1="0.127" x2="0.254" y2="-0.127" width="1.27" layer="51" curve="-180" cap="flat"/>
<wire x1="1.651" y1="-0.762" x2="1.651" y2="0.762" width="0.2032" layer="21"/>
<smd name="1" x="-0.762" y="0" dx="1.1684" dy="1.6002" layer="1" cream="no"/>
<smd name="2" x="0.762" y="0" dx="1.1684" dy="1.6002" layer="1" cream="no"/>
<smd name="WIRE" x="0" y="0" dx="0.635" dy="1.6002" layer="1" cream="no"/>
<text x="-1.651" y="1.143" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-1.524" y="-1.651" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-0.0762" y1="-0.9144" x2="0.0762" y2="0.9144" layer="29"/>
</package>
<package name="USB_C_CUSB31-CFM2AX-01-X">
<smd name="A1B12" x="-3.2" y="7.355" dx="0.575" dy="1.15" layer="1"/>
<smd name="A4B9" x="-2.4" y="7.355" dx="0.575" dy="1.15" layer="1"/>
<smd name="B8" x="-1.75" y="7.355" dx="0.275" dy="1.15" layer="1"/>
<smd name="A5" x="-1.25" y="7.355" dx="0.275" dy="1.15" layer="1"/>
<smd name="B7" x="-0.75" y="7.355" dx="0.275" dy="1.15" layer="1"/>
<smd name="A6" x="-0.25" y="7.355" dx="0.275" dy="1.15" layer="1"/>
<smd name="A7" x="0.25" y="7.355" dx="0.275" dy="1.15" layer="1"/>
<smd name="B6" x="0.75" y="7.355" dx="0.275" dy="1.15" layer="1"/>
<smd name="A8" x="1.25" y="7.355" dx="0.275" dy="1.15" layer="1"/>
<smd name="B5" x="1.75" y="7.355" dx="0.275" dy="1.15" layer="1"/>
<smd name="B4A9" x="2.4" y="7.355" dx="0.575" dy="1.15" layer="1"/>
<smd name="B1A12" x="3.2" y="7.355" dx="0.575" dy="1.15" layer="1"/>
<pad name="M3" x="-4.32" y="2.6" drill="0.6" diameter="1" shape="long" rot="R90"/>
<wire x1="-4.62" y1="2.9" x2="-4.32" y2="3.2" width="0" layer="46" curve="-90"/>
<wire x1="-4.32" y1="3.2" x2="-4.02" y2="2.9" width="0" layer="46" curve="-90"/>
<wire x1="-4.02" y1="2.9" x2="-4.02" y2="2.3" width="0" layer="46"/>
<wire x1="-4.02" y1="2.3" x2="-4.32" y2="2" width="0" layer="46" curve="-90"/>
<wire x1="-4.32" y1="2" x2="-4.62" y2="2.3" width="0" layer="46" curve="-90"/>
<wire x1="-4.62" y1="2.3" x2="-4.62" y2="2.9" width="0" layer="46"/>
<pad name="M4" x="4.32" y="2.6" drill="0.6" diameter="1" shape="long" rot="R90"/>
<wire x1="4.02" y1="2.9" x2="4.32" y2="3.2" width="0" layer="46" curve="-90"/>
<wire x1="4.32" y1="3.2" x2="4.62" y2="2.9" width="0" layer="46" curve="-90"/>
<wire x1="4.62" y1="2.9" x2="4.62" y2="2.3" width="0" layer="46"/>
<wire x1="4.62" y1="2.3" x2="4.32" y2="2" width="0" layer="46" curve="-90"/>
<wire x1="4.32" y1="2" x2="4.02" y2="2.3" width="0" layer="46" curve="-90"/>
<wire x1="4.02" y1="2.3" x2="4.02" y2="2.9" width="0" layer="46"/>
<pad name="M2" x="4.32" y="6.78" drill="0.6" diameter="1" shape="long" rot="R90"/>
<wire x1="4.02" y1="7.33" x2="4.32" y2="7.63" width="0" layer="46" curve="-90"/>
<wire x1="4.32" y1="7.63" x2="4.62" y2="7.33" width="0" layer="46" curve="-90"/>
<wire x1="4.62" y1="7.33" x2="4.62" y2="6.23" width="0" layer="46"/>
<wire x1="4.62" y1="6.23" x2="4.32" y2="5.93" width="0" layer="46" curve="-90"/>
<wire x1="4.32" y1="5.93" x2="4.02" y2="6.23" width="0" layer="46" curve="-90"/>
<wire x1="4.02" y1="6.23" x2="4.02" y2="7.33" width="0" layer="46"/>
<pad name="M1" x="-4.32" y="6.78" drill="0.6" diameter="1" shape="long" rot="R90"/>
<wire x1="-4.62" y1="7.33" x2="-4.32" y2="7.63" width="0" layer="46" curve="-90"/>
<wire x1="-4.32" y1="7.63" x2="-4.02" y2="7.33" width="0" layer="46" curve="-90"/>
<wire x1="-4.02" y1="7.33" x2="-4.02" y2="6.23" width="0" layer="46"/>
<wire x1="-4.02" y1="6.23" x2="-4.32" y2="5.93" width="0" layer="46" curve="-90"/>
<wire x1="-4.32" y1="5.93" x2="-4.62" y2="6.23" width="0" layer="46" curve="-90"/>
<wire x1="-4.62" y1="6.23" x2="-4.62" y2="7.33" width="0" layer="46"/>
<hole x="2.89" y="6.28" drill="0.65"/>
<hole x="-2.89" y="6.28" drill="0.65"/>
<wire x1="-4.47" y1="0" x2="-4.47" y2="7.35" width="0.05" layer="51"/>
<wire x1="4.47" y1="7.35" x2="4.47" y2="0" width="0.05" layer="51"/>
<wire x1="4.47" y1="0" x2="-4.47" y2="0" width="0.05" layer="51"/>
<wire x1="-4.47" y1="4" x2="-4.47" y2="5.35" width="0.1016" layer="21"/>
<wire x1="4.47" y1="5.35" x2="4.47" y2="4" width="0.1016" layer="21"/>
<wire x1="4.47" y1="0" x2="-4.47" y2="0" width="0.1016" layer="21"/>
<wire x1="-4.47" y1="0" x2="-4.47" y2="1.35" width="0.1016" layer="21"/>
<wire x1="4.47" y1="1.35" x2="4.47" y2="0" width="0.1016" layer="21"/>
<text x="-2.75" y="0.25" size="0.8128" layer="25" ratio="18" rot="R90">&gt;NAME</text>
<text x="-1.5" y="0.25" size="0.4064" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<wire x1="-4.47" y1="7.35" x2="-3.53" y2="7.35" width="0.05" layer="51"/>
<wire x1="3.53" y1="7.35" x2="4.47" y2="7.35" width="0.05" layer="51"/>
<polygon width="0" layer="31">
<vertex x="-4.826" y="6.7818"/>
<vertex x="-4.826" y="7.2644" curve="-90"/>
<vertex x="-4.318" y="7.7724" curve="-90"/>
<vertex x="-3.8354" y="7.2898"/>
<vertex x="-3.8354" y="6.7818"/>
<vertex x="-3.8354" y="6.2738" curve="-90"/>
<vertex x="-4.318" y="5.7912" curve="-90"/>
<vertex x="-4.826" y="6.2992"/>
</polygon>
<polygon width="0" layer="31">
<vertex x="3.8227" y="6.7945"/>
<vertex x="3.8227" y="7.2771" curve="-90"/>
<vertex x="4.3307" y="7.7851" curve="-90"/>
<vertex x="4.8133" y="7.3025"/>
<vertex x="4.8133" y="6.7945"/>
<vertex x="4.8133" y="6.2865" curve="-90"/>
<vertex x="4.3307" y="5.8039" curve="-90"/>
<vertex x="3.8227" y="6.3119"/>
</polygon>
<polygon width="0" layer="31">
<vertex x="3.8227" y="2.6035"/>
<vertex x="3.8227" y="3.0861" curve="-90"/>
<vertex x="4.3307" y="3.5941" curve="-90"/>
<vertex x="4.8133" y="3.1115"/>
<vertex x="4.8133" y="2.6035"/>
<vertex x="4.8133" y="2.0955" curve="-90"/>
<vertex x="4.3307" y="1.6129" curve="-90"/>
<vertex x="3.8227" y="2.1209"/>
</polygon>
<polygon width="0" layer="31">
<vertex x="-4.8133" y="2.6035"/>
<vertex x="-4.8133" y="3.0861" curve="-90"/>
<vertex x="-4.3053" y="3.5941" curve="-90"/>
<vertex x="-3.8227" y="3.1115"/>
<vertex x="-3.8227" y="2.6035"/>
<vertex x="-3.8227" y="2.0955" curve="-90"/>
<vertex x="-4.3053" y="1.6129" curve="-90"/>
<vertex x="-4.8133" y="2.1209"/>
</polygon>
</package>
<package name="SSOP24">
<description>&lt;b&gt;Small Shrink Outline Package&lt;/b&gt;&lt;p&gt;
SOT340-1 / JEDEC MO-150AG</description>
<wire x1="-4.128" y1="-2.536" x2="4.128" y2="-2.536" width="0.2032" layer="21"/>
<wire x1="4.128" y1="-2.536" x2="4.128" y2="2.536" width="0.2032" layer="21"/>
<wire x1="4.128" y1="2.536" x2="-4.128" y2="2.536" width="0.2032" layer="21"/>
<wire x1="-4.128" y1="-2.536" x2="-4.128" y2="2.536" width="0.2032" layer="21"/>
<wire x1="-3.874" y1="-2.286" x2="3.874" y2="-2.286" width="0.0508" layer="21"/>
<wire x1="3.874" y1="2.286" x2="3.874" y2="-2.286" width="0.0508" layer="21"/>
<wire x1="3.874" y1="2.286" x2="-3.874" y2="2.286" width="0.0508" layer="21"/>
<wire x1="-3.874" y1="-2.286" x2="-3.874" y2="2.286" width="0.0508" layer="21"/>
<circle x="-2.8829" y="-1.397" radius="0.635" width="0.2032" layer="21"/>
<smd name="1" x="-3.575" y="-3.42" dx="0.4" dy="1.2" layer="1"/>
<smd name="2" x="-2.925" y="-3.42" dx="0.4" dy="1.2" layer="1"/>
<smd name="3" x="-2.275" y="-3.42" dx="0.4" dy="1.2" layer="1"/>
<smd name="4" x="-1.625" y="-3.42" dx="0.4" dy="1.2" layer="1"/>
<smd name="5" x="-0.975" y="-3.42" dx="0.4" dy="1.2" layer="1"/>
<smd name="6" x="-0.325" y="-3.42" dx="0.4" dy="1.2" layer="1"/>
<smd name="7" x="0.325" y="-3.42" dx="0.4" dy="1.2" layer="1"/>
<smd name="8" x="0.975" y="-3.42" dx="0.4" dy="1.2" layer="1"/>
<smd name="9" x="1.625" y="-3.42" dx="0.4" dy="1.2" layer="1"/>
<smd name="10" x="2.275" y="-3.42" dx="0.4" dy="1.2" layer="1"/>
<smd name="11" x="2.925" y="-3.42" dx="0.4" dy="1.2" layer="1"/>
<smd name="12" x="3.575" y="-3.42" dx="0.4" dy="1.2" layer="1"/>
<smd name="13" x="3.575" y="3.42" dx="0.4" dy="1.2" layer="1"/>
<smd name="14" x="2.925" y="3.42" dx="0.4" dy="1.2" layer="1"/>
<smd name="15" x="2.275" y="3.42" dx="0.4" dy="1.2" layer="1"/>
<smd name="16" x="1.625" y="3.42" dx="0.4" dy="1.2" layer="1"/>
<smd name="17" x="0.975" y="3.42" dx="0.4" dy="1.2" layer="1"/>
<smd name="18" x="0.325" y="3.42" dx="0.4" dy="1.2" layer="1"/>
<smd name="19" x="-0.325" y="3.42" dx="0.4" dy="1.2" layer="1"/>
<smd name="20" x="-0.975" y="3.42" dx="0.4" dy="1.2" layer="1"/>
<smd name="21" x="-1.625" y="3.42" dx="0.4" dy="1.2" layer="1"/>
<smd name="22" x="-2.275" y="3.42" dx="0.4" dy="1.2" layer="1"/>
<smd name="23" x="-2.925" y="3.42" dx="0.4" dy="1.2" layer="1"/>
<smd name="24" x="-3.575" y="3.42" dx="0.4" dy="1.2" layer="1"/>
<text x="-2.667" y="0.6604" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-2.6289" y="-0.381" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-3.725" y1="-3.8" x2="-3.425" y2="-2.6" layer="51"/>
<rectangle x1="-3.075" y1="-3.8" x2="-2.775" y2="-2.6" layer="51"/>
<rectangle x1="-2.425" y1="-3.8" x2="-2.125" y2="-2.6" layer="51"/>
<rectangle x1="-1.775" y1="-3.8" x2="-1.475" y2="-2.6" layer="51"/>
<rectangle x1="-1.125" y1="-3.8" x2="-0.825" y2="-2.6" layer="51"/>
<rectangle x1="-0.475" y1="-3.8" x2="-0.175" y2="-2.6" layer="51"/>
<rectangle x1="0.175" y1="-3.8" x2="0.475" y2="-2.6" layer="51"/>
<rectangle x1="0.825" y1="-3.8" x2="1.125" y2="-2.6" layer="51"/>
<rectangle x1="1.475" y1="-3.8" x2="1.775" y2="-2.6" layer="51"/>
<rectangle x1="2.125" y1="-3.8" x2="2.425" y2="-2.6" layer="51"/>
<rectangle x1="2.775" y1="-3.8" x2="3.075" y2="-2.6" layer="51"/>
<rectangle x1="3.425" y1="-3.8" x2="3.725" y2="-2.6" layer="51"/>
<rectangle x1="3.425" y1="2.6" x2="3.725" y2="3.8" layer="51"/>
<rectangle x1="2.775" y1="2.6" x2="3.075" y2="3.8" layer="51"/>
<rectangle x1="2.125" y1="2.6" x2="2.425" y2="3.8" layer="51"/>
<rectangle x1="1.475" y1="2.6" x2="1.775" y2="3.8" layer="51"/>
<rectangle x1="0.825" y1="2.6" x2="1.125" y2="3.8" layer="51"/>
<rectangle x1="0.175" y1="2.6" x2="0.475" y2="3.8" layer="51"/>
<rectangle x1="-0.475" y1="2.6" x2="-0.175" y2="3.8" layer="51"/>
<rectangle x1="-1.125" y1="2.6" x2="-0.825" y2="3.8" layer="51"/>
<rectangle x1="-1.775" y1="2.6" x2="-1.475" y2="3.8" layer="51"/>
<rectangle x1="-2.425" y1="2.6" x2="-2.125" y2="3.8" layer="51"/>
<rectangle x1="-3.075" y1="2.6" x2="-2.775" y2="3.8" layer="51"/>
<rectangle x1="-3.725" y1="2.6" x2="-3.425" y2="3.8" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="RESISTOR">
<wire x1="-2.54" y1="1.27" x2="2.54" y2="1.27" width="0.254" layer="94"/>
<wire x1="2.54" y1="1.27" x2="2.54" y2="-1.27" width="0.254" layer="94"/>
<wire x1="2.54" y1="-1.27" x2="-2.54" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-1.27" x2="-2.54" y2="1.27" width="0.254" layer="94"/>
<text x="0" y="2.54" size="1.27" layer="95" font="vector" align="center">&gt;NAME</text>
<text x="0" y="0" size="1.016" layer="96" font="vector" ratio="15" align="center">&gt;VALUE</text>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
<pin name="2" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
<symbol name="3.3V">
<wire x1="-1.27" y1="-1.27" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="1.27" y2="-1.27" width="0.254" layer="94"/>
<text x="-1.524" y="1.016" size="1.27" layer="96">&gt;VALUE</text>
<pin name="3.3V" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="ESP8266-12">
<wire x1="-12.7" y1="15.24" x2="12.7" y2="15.24" width="0.254" layer="94"/>
<wire x1="12.7" y1="15.24" x2="12.7" y2="-15.24" width="0.254" layer="94"/>
<wire x1="12.7" y1="-15.24" x2="-12.7" y2="-15.24" width="0.254" layer="94"/>
<wire x1="-12.7" y1="-15.24" x2="-12.7" y2="15.24" width="0.254" layer="94"/>
<wire x1="-7.62" y1="7.62" x2="-7.62" y2="12.7" width="0.254" layer="94"/>
<wire x1="-7.62" y1="12.7" x2="-5.08" y2="12.7" width="0.254" layer="94"/>
<wire x1="-5.08" y1="12.7" x2="-5.08" y2="10.16" width="0.254" layer="94"/>
<wire x1="-5.08" y1="10.16" x2="-2.54" y2="10.16" width="0.254" layer="94"/>
<wire x1="-2.54" y1="10.16" x2="-2.54" y2="12.7" width="0.254" layer="94"/>
<wire x1="-2.54" y1="12.7" x2="0" y2="12.7" width="0.254" layer="94"/>
<wire x1="0" y1="12.7" x2="0" y2="10.16" width="0.254" layer="94"/>
<wire x1="0" y1="10.16" x2="2.54" y2="10.16" width="0.254" layer="94"/>
<wire x1="2.54" y1="10.16" x2="2.54" y2="12.7" width="0.254" layer="94"/>
<wire x1="2.54" y1="12.7" x2="5.08" y2="12.7" width="0.254" layer="94"/>
<wire x1="5.08" y1="12.7" x2="5.08" y2="10.16" width="0.254" layer="94"/>
<wire x1="5.08" y1="10.16" x2="7.62" y2="10.16" width="0.254" layer="94"/>
<wire x1="7.62" y1="10.16" x2="7.62" y2="12.7" width="0.254" layer="94"/>
<pin name="RESET" x="-17.78" y="5.08" length="middle" direction="in"/>
<pin name="ADC" x="-17.78" y="2.54" length="middle" direction="pas"/>
<pin name="CH_PD" x="-17.78" y="0" length="middle" direction="in"/>
<pin name="GPIO16" x="-17.78" y="-2.54" length="middle"/>
<pin name="GPIO14" x="-17.78" y="-5.08" length="middle"/>
<pin name="GPIO12" x="-17.78" y="-7.62" length="middle"/>
<pin name="GPIO13" x="-17.78" y="-10.16" length="middle"/>
<pin name="VCC" x="-17.78" y="-12.7" length="middle" direction="pwr"/>
<pin name="GND" x="17.78" y="-12.7" length="middle" direction="pwr" rot="R180"/>
<pin name="GPIO15" x="17.78" y="-10.16" length="middle" rot="R180"/>
<pin name="GPIO2" x="17.78" y="-7.62" length="middle" rot="R180"/>
<pin name="GPIO0" x="17.78" y="-5.08" length="middle" rot="R180"/>
<pin name="GPIO4" x="17.78" y="-2.54" length="middle" rot="R180"/>
<pin name="GPIO5" x="17.78" y="0" length="middle" rot="R180"/>
<pin name="RXD" x="17.78" y="2.54" length="middle" direction="in" rot="R180"/>
<pin name="TXD" x="17.78" y="5.08" length="middle" direction="out" rot="R180"/>
<text x="0" y="0" size="1.778" layer="94" font="vector" ratio="12" rot="R90" align="center">ESP12</text>
</symbol>
<symbol name="THERMAL-SLUG">
<wire x1="-5.08" y1="5.08" x2="5.08" y2="5.08" width="0.254" layer="94" style="shortdash"/>
<wire x1="5.08" y1="5.08" x2="5.08" y2="-5.08" width="0.254" layer="94" style="shortdash"/>
<wire x1="5.08" y1="-5.08" x2="-5.08" y2="-5.08" width="0.254" layer="94" style="shortdash"/>
<wire x1="-5.08" y1="-5.08" x2="-5.08" y2="5.08" width="0.254" layer="94" style="shortdash"/>
<text x="-4.445" y="0.635" size="1.4224" layer="95" ratio="10">THERMAL</text>
<text x="-1.905" y="-2.54" size="1.4224" layer="95" ratio="10">PAD</text>
<text x="-5.08" y="6.35" size="1.778" layer="95">&gt;NAME</text>
<pin name="TP" x="0" y="-7.62" visible="off" length="short" direction="pwr" rot="R90"/>
</symbol>
<symbol name="CAPACITOR">
<wire x1="0" y1="0.762" x2="0" y2="0" width="0.1524" layer="94"/>
<wire x1="0" y1="2.54" x2="0" y2="1.778" width="0.1524" layer="94"/>
<text x="-2.29" y="1.25" size="1.27" layer="95" font="vector" rot="R90" align="center">&gt;NAME</text>
<text x="2.3" y="1.25" size="1.27" layer="96" font="vector" rot="R90" align="center">&gt;VALUE</text>
<rectangle x1="-1.27" y1="0.508" x2="1.27" y2="1.016" layer="94"/>
<rectangle x1="-1.27" y1="1.524" x2="1.27" y2="2.032" layer="94"/>
<pin name="1" x="0" y="5.08" visible="off" length="short" direction="pas" swaplevel="1" rot="R270"/>
<pin name="2" x="0" y="-2.54" visible="off" length="short" direction="pas" swaplevel="1" rot="R90"/>
</symbol>
<symbol name="GND">
<wire x1="-1.27" y1="0" x2="1.27" y2="0" width="0.254" layer="94"/>
<text x="-1.524" y="-2.54" size="1.27" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
<symbol name="VBUS">
<text x="-1.524" y="1.016" size="1.27" layer="96">&gt;VALUE</text>
<pin name="VBUS" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
<wire x1="-1.27" y1="-1.27" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="1.27" y2="-1.27" width="0.254" layer="94"/>
</symbol>
<symbol name="CP2104">
<pin name="RI" x="15.24" y="-5.08" length="short" direction="in" rot="R180"/>
<pin name="GND" x="-15.24" y="5.08" length="short" direction="pwr"/>
<pin name="D+" x="-15.24" y="-7.62" length="short"/>
<pin name="D-" x="-15.24" y="-10.16" length="short"/>
<pin name="VIO" x="-15.24" y="20.32" length="short" direction="pwr"/>
<pin name="VDD" x="-15.24" y="17.78" length="short" direction="pwr"/>
<pin name="REGIN" x="-15.24" y="15.24" length="short" direction="pwr"/>
<pin name="VBUS" x="-15.24" y="-5.08" length="short" direction="pwr"/>
<pin name="#RST" x="15.24" y="20.32" length="short" rot="R180"/>
<pin name="NC" x="-15.24" y="-22.86" length="short" direction="nc"/>
<pin name="GPIO3" x="15.24" y="0" length="short" rot="R180"/>
<pin name="GPIO2" x="15.24" y="2.54" length="short" rot="R180"/>
<pin name="DCD" x="15.24" y="-7.62" length="short" direction="in" rot="R180"/>
<pin name="DTR" x="15.24" y="-10.16" length="short" direction="out" rot="R180"/>
<pin name="DSR" x="15.24" y="-12.7" length="short" direction="in" rot="R180"/>
<pin name="TXD" x="15.24" y="-15.24" length="short" direction="out" rot="R180"/>
<pin name="RXD" x="15.24" y="-17.78" length="short" direction="in" rot="R180"/>
<pin name="RTS" x="15.24" y="-20.32" length="short" direction="out" rot="R180"/>
<pin name="CTS" x="15.24" y="-22.86" length="short" direction="in" rot="R180"/>
<pin name="SUSPEND" x="15.24" y="12.7" length="short" direction="out" rot="R180"/>
<pin name="VPP" x="-15.24" y="-15.24" length="short"/>
<pin name="#SUSPEND" x="15.24" y="15.24" length="short" direction="out" rot="R180"/>
<pin name="GPIO0/TXLED" x="15.24" y="7.62" length="short" rot="R180"/>
<pin name="GPIO1/RXLED" x="15.24" y="5.08" length="short" rot="R180"/>
<wire x1="-12.7" y1="22.86" x2="12.7" y2="22.86" width="0.254" layer="94" style="shortdash"/>
<wire x1="12.7" y1="22.86" x2="12.7" y2="-25.4" width="0.254" layer="94"/>
<wire x1="12.7" y1="-25.4" x2="-12.7" y2="-25.4" width="0.254" layer="94" style="shortdash"/>
<wire x1="-12.7" y1="-25.4" x2="-12.7" y2="22.86" width="0.254" layer="94"/>
<text x="0" y="25.4" size="1.27" layer="94" align="center">CP2104
USB/UART BRIDGE</text>
<text x="0" y="-27.94" size="1.27" layer="94" align="center">VIO: 1.8-VDD
Op. Temp: -40~85°C</text>
<wire x1="-12.7" y1="-25.4" x2="-12.7" y2="-30.48" width="0.254" layer="94"/>
<wire x1="-12.7" y1="-30.48" x2="12.7" y2="-30.48" width="0.254" layer="94"/>
<wire x1="12.7" y1="-30.48" x2="12.7" y2="-25.4" width="0.254" layer="94"/>
<wire x1="-12.7" y1="22.86" x2="-12.7" y2="27.94" width="0.254" layer="94"/>
<wire x1="-12.7" y1="27.94" x2="12.7" y2="27.94" width="0.254" layer="94"/>
<wire x1="12.7" y1="27.94" x2="12.7" y2="22.86" width="0.254" layer="94"/>
<text x="-12.7" y="29.21" size="1.27" layer="95">&gt;NAME</text>
<text x="-12.7" y="-33.02" size="1.27" layer="96">&gt;VALUE</text>
<polygon width="0.254" layer="94">
<vertex x="12.7" y="-4.445"/>
<vertex x="11.43" y="-5.08"/>
<vertex x="12.7" y="-5.715"/>
</polygon>
<polygon width="0.254" layer="94">
<vertex x="12.7" y="-6.985"/>
<vertex x="11.43" y="-7.62"/>
<vertex x="12.7" y="-8.255"/>
</polygon>
<polygon width="0.254" layer="94">
<vertex x="11.43" y="-9.525"/>
<vertex x="11.43" y="-10.795"/>
<vertex x="12.7" y="-10.16"/>
</polygon>
<polygon width="0.254" layer="94">
<vertex x="12.7" y="-12.065"/>
<vertex x="11.43" y="-12.7"/>
<vertex x="12.7" y="-13.335"/>
</polygon>
<polygon width="0.254" layer="94">
<vertex x="11.43" y="-14.605"/>
<vertex x="11.43" y="-15.875"/>
<vertex x="12.7" y="-15.24"/>
</polygon>
<polygon width="0.254" layer="94">
<vertex x="12.7" y="-17.145"/>
<vertex x="11.43" y="-17.78"/>
<vertex x="12.7" y="-18.415"/>
</polygon>
<polygon width="0.254" layer="94">
<vertex x="11.43" y="-19.685"/>
<vertex x="11.43" y="-20.955"/>
<vertex x="12.7" y="-20.32"/>
</polygon>
<polygon width="0.254" layer="94">
<vertex x="12.7" y="-22.225"/>
<vertex x="11.43" y="-22.86"/>
<vertex x="12.7" y="-23.495"/>
</polygon>
</symbol>
<symbol name="BUTTON_4PIN">
<wire x1="1.905" y1="0" x2="2.54" y2="0" width="0.254" layer="94"/>
<wire x1="1.905" y1="4.445" x2="1.905" y2="3.175" width="0.254" layer="94"/>
<wire x1="-1.905" y1="4.445" x2="-1.905" y2="3.175" width="0.254" layer="94"/>
<wire x1="1.905" y1="4.445" x2="0" y2="4.445" width="0.254" layer="94"/>
<wire x1="0" y1="4.445" x2="-1.905" y2="4.445" width="0.254" layer="94"/>
<wire x1="0" y1="2.54" x2="0" y2="1.905" width="0.1524" layer="94"/>
<wire x1="0" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="94"/>
<wire x1="0" y1="4.445" x2="0" y2="3.175" width="0.1524" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="-2.54" x2="-2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="0" x2="1.905" y2="1.27" width="0.254" layer="94"/>
<circle x="-2.54" y="0" radius="0.127" width="0.4064" layer="94"/>
<circle x="2.54" y="0" radius="0.127" width="0.4064" layer="94"/>
<text x="-2.54" y="6.35" size="1.27" layer="95">&gt;NAME</text>
<text x="-2.54" y="-5.08" size="1.27" layer="96">&gt;VALUE</text>
<pin name="P" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="2"/>
<pin name="S" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="S1" x="5.08" y="-2.54" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="P1" x="-5.08" y="-2.54" visible="off" length="short" direction="pas" swaplevel="2"/>
</symbol>
<symbol name="VBAT">
<text x="-1.524" y="1.016" size="1.27" layer="96">&gt;VALUE</text>
<pin name="VBAT" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
<wire x1="-1.27" y1="-1.27" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="1.27" y2="-1.27" width="0.254" layer="94"/>
</symbol>
<symbol name="VREG_SOT23-5">
<wire x1="-7.62" y1="-5.08" x2="-7.62" y2="5.08" width="0.254" layer="94"/>
<wire x1="-7.62" y1="5.08" x2="7.62" y2="5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="5.08" x2="7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="-5.08" x2="-7.62" y2="-5.08" width="0.254" layer="94"/>
<text x="-7.62" y="6.096" size="1.27" layer="95">&gt;NAME</text>
<text x="-7.62" y="-7.62" size="1.27" layer="95">&gt;VALUE</text>
<pin name="IN" x="-10.16" y="2.54" length="short" direction="pwr"/>
<pin name="OUT" x="10.16" y="2.54" length="short" direction="sup" rot="R180"/>
<pin name="EN" x="-10.16" y="0" length="short" direction="in"/>
<pin name="GND" x="-10.16" y="-2.54" length="short" direction="pwr"/>
<pin name="P4" x="10.16" y="-2.54" length="short" rot="R180"/>
</symbol>
<symbol name="DIODE-SCHOTTKY">
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-1.27" y1="-1.27" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="-1.27" y2="1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="1.27" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="1.27" y2="-1.27" width="0.254" layer="94"/>
<text x="0" y="2.54" size="1.27" layer="95" align="center">&gt;NAME</text>
<text x="0" y="-2.5" size="1.27" layer="96" align="center">&gt;VALUE</text>
<pin name="A" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
<pin name="C" x="2.54" y="0" visible="off" length="short" direction="pas" rot="R180"/>
<wire x1="1.27" y1="-1.27" x2="1.778" y2="-1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="1.27" x2="0.762" y2="1.27" width="0.254" layer="94"/>
</symbol>
<symbol name="PINHD2">
<wire x1="-6.35" y1="-2.54" x2="1.27" y2="-2.54" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="1.27" y2="5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="5.08" x2="-6.35" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="5.08" x2="-6.35" y2="-2.54" width="0.4064" layer="94"/>
<text x="-6.35" y="5.715" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
<symbol name="LED">
<wire x1="-2.54" y1="1.27" x2="-2.54" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-1.27" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-2.54" y2="1.27" width="0.254" layer="94"/>
<wire x1="0" y1="1.27" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-0.635" y1="1.27" x2="0.635" y2="2.54" width="0.254" layer="94"/>
<wire x1="-1.905" y1="1.27" x2="-0.635" y2="2.54" width="0.254" layer="94"/>
<wire x1="-0.9525" y1="2.8575" x2="-0.3175" y2="2.2225" width="0.254" layer="94"/>
<wire x1="-0.3175" y1="2.2225" x2="0" y2="3.175" width="0.254" layer="94"/>
<wire x1="0" y1="3.175" x2="-0.9525" y2="2.8575" width="0.254" layer="94"/>
<wire x1="0.3175" y1="2.8575" x2="0.9525" y2="2.2225" width="0.254" layer="94"/>
<wire x1="1.27" y1="3.175" x2="0.3175" y2="2.8575" width="0.254" layer="94"/>
<wire x1="0.9525" y1="2.2225" x2="1.27" y2="3.175" width="0.254" layer="94"/>
<text x="-1.27" y="4.445" size="1.27" layer="95" align="center">&gt;NAME</text>
<text x="-1.27" y="-2.794" size="1.27" layer="96" align="center">&gt;VALUE</text>
<pin name="A" x="-5.08" y="0" visible="off" length="short" direction="pas"/>
<pin name="C" x="2.54" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
<symbol name="MCP73831/2">
<pin name="VDD" x="-12.7" y="2.54" length="short" direction="pwr"/>
<pin name="STAT" x="-12.7" y="-2.54" length="short" direction="out"/>
<pin name="VBAT" x="12.7" y="2.54" length="short" direction="pwr" rot="R180"/>
<pin name="PROG" x="12.7" y="0" length="short" direction="in" rot="R180"/>
<pin name="VSS" x="12.7" y="-2.54" length="short" direction="pwr" rot="R180"/>
<wire x1="-10.16" y1="5.08" x2="10.16" y2="5.08" width="0.254" layer="94" style="shortdash"/>
<wire x1="10.16" y1="5.08" x2="10.16" y2="-5.08" width="0.254" layer="94"/>
<wire x1="10.16" y1="-5.08" x2="-10.16" y2="-5.08" width="0.254" layer="94" style="shortdash"/>
<wire x1="-10.16" y1="-5.08" x2="-10.16" y2="5.08" width="0.254" layer="94"/>
<text x="-5.715" y="8.255" size="1.27" layer="94">MCP73831/2</text>
<text x="-6.35" y="6.35" size="1.27" layer="94">LIPO Charger</text>
<text x="-8.255" y="-9.525" size="1.27" layer="94">Temp:</text>
<text x="0" y="-9.525" size="1.27" layer="94">-40-85°C</text>
<text x="-8.255" y="-7.62" size="1.27" layer="94">VDD:</text>
<text x="0" y="-7.62" size="1.27" layer="94">3.75-6V</text>
<wire x1="10.16" y1="-10.16" x2="-10.16" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-10.16" y1="10.16" x2="10.16" y2="10.16" width="0.254" layer="94"/>
<wire x1="-10.16" y1="10.16" x2="-10.16" y2="5.08" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-5.08" x2="-10.16" y2="-10.16" width="0.254" layer="94"/>
<wire x1="10.16" y1="10.16" x2="10.16" y2="5.08" width="0.254" layer="94"/>
<wire x1="10.16" y1="-5.08" x2="10.16" y2="-10.16" width="0.254" layer="94"/>
<text x="-10.16" y="11.43" size="1.27" layer="95">&gt;NAME</text>
<text x="-10.16" y="-12.7" size="1.27" layer="95">&gt;VALUE</text>
</symbol>
<symbol name="SOLDERJUMPER_CLOSED">
<wire x1="0.381" y1="0.635" x2="0.381" y2="-0.635" width="1.27" layer="94" curve="-180" cap="flat"/>
<wire x1="-0.381" y1="-0.635" x2="-0.381" y2="0.635" width="1.27" layer="94" curve="-180" cap="flat"/>
<wire x1="2.54" y1="0" x2="1.651" y2="0" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="0" x2="-1.651" y2="0" width="0.1524" layer="94"/>
<wire x1="-0.635" y1="0" x2="0.635" y2="0" width="0.4064" layer="94"/>
<text x="-2.54" y="2.54" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.54" y="-3.81" size="1.778" layer="96">&gt;VALUE</text>
<pin name="2" x="5.08" y="0" visible="pad" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="1" x="-5.08" y="0" visible="pad" length="short" direction="pas" swaplevel="1"/>
</symbol>
<symbol name="USB_C">
<wire x1="-10.2" y1="7.62" x2="-10.16" y2="12.7" width="0.254" layer="94"/>
<wire x1="-10.16" y1="12.7" x2="7.62" y2="12.7" width="0.254" layer="94"/>
<wire x1="7.62" y1="12.7" x2="7.62" y2="-12.7" width="0.254" layer="94"/>
<wire x1="-1.32" y1="1.6" x2="-3.47" y2="1.6" width="0.254" layer="94"/>
<wire x1="-3.47" y1="1.6" x2="-4.22" y2="1.6" width="0.254" layer="94"/>
<wire x1="-5.52" y1="3.2" x2="-4.52" y2="3.2" width="0.254" layer="94"/>
<wire x1="-6.27" y1="0.15" x2="-5.07" y2="0.15" width="0.254" layer="94"/>
<wire x1="-5.07" y1="0.15" x2="-4.22" y2="1.6" width="0.254" layer="94"/>
<wire x1="-4.52" y1="3.2" x2="-3.47" y2="1.6" width="0.254" layer="94"/>
<wire x1="-4.22" y1="1.6" x2="-7.92" y2="1.6" width="0.254" layer="94"/>
<wire x1="-7.92" y1="1.6" x2="-7.92" y2="0.8" width="0.254" layer="94"/>
<wire x1="-7.92" y1="0.8" x2="-8.12" y2="0.8" width="0.254" layer="94"/>
<wire x1="-8.12" y1="0.8" x2="-8.92" y2="1.6" width="0.254" layer="94"/>
<wire x1="-8.92" y1="1.6" x2="-8.12" y2="2.4" width="0.254" layer="94"/>
<wire x1="-8.12" y1="1" x2="-8.12" y2="2.4" width="0.254" layer="94"/>
<wire x1="-8.12" y1="2.4" x2="-7.92" y2="2.4" width="0.254" layer="94"/>
<wire x1="-7.92" y1="2.4" x2="-7.92" y2="1.6" width="0.254" layer="94"/>
<wire x1="-8.52" y1="1.6" x2="-8.52" y2="1.4" width="0.254" layer="94"/>
<wire x1="-8.52" y1="1.4" x2="-8.32" y2="1.2" width="0.254" layer="94"/>
<wire x1="-8.32" y1="1.2" x2="-8.32" y2="2" width="0.254" layer="94"/>
<wire x1="-8.32" y1="2" x2="-8.72" y2="1.6" width="0.254" layer="94"/>
<wire x1="-10.16" y1="12.7" x2="-10.16" y2="-12.7" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-12.7" x2="7.62" y2="-12.7" width="0.254" layer="94"/>
<circle x="-1.32" y="1.6" radius="0.5" width="1" layer="94"/>
<circle x="-5.92" y="3.2" radius="0.2" width="1" layer="94"/>
<text x="-10.16" y="13.716" size="1.27" layer="95">&gt;NAME</text>
<text x="-10.16" y="-15.24" size="1.27" layer="96">&gt;VALUE</text>
<rectangle x1="-7.12" y1="-0.45" x2="-5.92" y2="0.75" layer="94"/>
<pin name="D+" x="10.16" y="7.62" visible="pin" length="short" rot="R180"/>
<pin name="D-" x="10.16" y="5.08" visible="pin" length="short" rot="R180"/>
<pin name="VBUS" x="10.16" y="10.16" visible="pin" length="short" direction="pwr" rot="R180"/>
<pin name="GND" x="10.16" y="-10.16" visible="pin" length="short" direction="pwr" rot="R180"/>
<pin name="CC1" x="10.16" y="2.54" visible="pin" length="short" rot="R180"/>
<pin name="SBU1" x="10.16" y="-2.54" visible="pin" length="short" rot="R180"/>
<pin name="CC2" x="10.16" y="0" visible="pin" length="short" rot="R180"/>
<pin name="SBU2" x="10.16" y="-5.08" visible="pin" length="short" rot="R180"/>
<text x="-5.08" y="-2.54" size="1.27" layer="94" align="center">USB C</text>
</symbol>
<symbol name="TB6612FNG">
<pin name="VCC" x="-17.78" y="22.86" length="short" direction="pwr"/>
<pin name="STBY" x="-17.78" y="2.54" length="short" direction="in"/>
<pin name="AIN1" x="-17.78" y="17.78" length="short" direction="in"/>
<pin name="AIN2" x="-17.78" y="15.24" length="short" direction="in"/>
<pin name="PWMA" x="-17.78" y="12.7" length="short" direction="in"/>
<pin name="BIN1" x="-17.78" y="-7.62" length="short" direction="in"/>
<pin name="BIN2" x="-17.78" y="-10.16" length="short" direction="in"/>
<pin name="PWMB" x="-17.78" y="-12.7" length="short" direction="in"/>
<pin name="GND@1" x="-17.78" y="-20.32" length="short" direction="pwr"/>
<pin name="VM@1" x="20.32" y="22.86" length="short" direction="pwr" rot="R180"/>
<pin name="AOUT1@1" x="20.32" y="17.78" length="short" direction="out" rot="R180"/>
<pin name="AOUT1@2" x="20.32" y="15.24" length="short" direction="out" rot="R180"/>
<pin name="AOUT2@1" x="20.32" y="12.7" length="short" direction="out" rot="R180"/>
<pin name="AOUT2@2" x="20.32" y="10.16" length="short" direction="out" rot="R180"/>
<pin name="PGND1@1" x="20.32" y="7.62" length="short" direction="pwr" rot="R180"/>
<pin name="PGND1@2" x="20.32" y="5.08" length="short" direction="pwr" rot="R180"/>
<pin name="VM@2" x="20.32" y="0" length="short" direction="pwr" rot="R180"/>
<pin name="VM@3" x="20.32" y="-2.54" length="short" direction="pwr" rot="R180"/>
<pin name="BOUT1@1" x="20.32" y="-7.62" length="short" direction="out" rot="R180"/>
<pin name="BOUT1@2" x="20.32" y="-10.16" length="short" direction="out" rot="R180"/>
<pin name="BOUT2@1" x="20.32" y="-12.7" length="short" direction="out" rot="R180"/>
<pin name="BOUT2@2" x="20.32" y="-15.24" length="short" direction="out" rot="R180"/>
<pin name="PGND2@1" x="20.32" y="-17.78" length="short" direction="pwr" rot="R180"/>
<pin name="PGND2@2" x="20.32" y="-20.32" length="short" direction="pwr" rot="R180"/>
<wire x1="-15.24" y1="25.4" x2="17.78" y2="25.4" width="0.254" layer="94" style="shortdash"/>
<wire x1="17.78" y1="25.4" x2="17.78" y2="-22.86" width="0.254" layer="94"/>
<wire x1="17.78" y1="-22.86" x2="-15.24" y2="-22.86" width="0.254" layer="94" style="shortdash"/>
<wire x1="-15.24" y1="-22.86" x2="-15.24" y2="25.4" width="0.254" layer="94"/>
<text x="-5.08" y="30.48" size="1.27" layer="94">TB6612FNG</text>
<text x="-12.7" y="27.94" size="1.27" layer="94">Dual H-Bridge Motor Driver</text>
<text x="-10.16" y="-25.4" size="1.27" layer="94">VM:</text>
<text x="2.54" y="-25.4" size="1.27" layer="94">4.5-13.5V</text>
<text x="-10.16" y="-30.48" size="1.27" layer="94">IOUT/ch:</text>
<text x="2.54" y="-30.48" size="1.27" layer="94">1A</text>
<text x="-10.16" y="-33.02" size="1.27" layer="94">Temp:</text>
<text x="2.54" y="-33.02" size="1.27" layer="94">-20°C-85°C</text>
<wire x1="-15.24" y1="25.4" x2="-15.24" y2="33.02" width="0.254" layer="94"/>
<wire x1="-15.24" y1="33.02" x2="17.78" y2="33.02" width="0.254" layer="94"/>
<wire x1="17.78" y1="33.02" x2="17.78" y2="25.4" width="0.254" layer="94"/>
<wire x1="-15.24" y1="-22.86" x2="-15.24" y2="-35.56" width="0.254" layer="94"/>
<wire x1="-15.24" y1="-35.56" x2="17.78" y2="-35.56" width="0.254" layer="94"/>
<wire x1="17.78" y1="-35.56" x2="17.78" y2="-22.86" width="0.254" layer="94"/>
<text x="-15.24" y="35.56" size="1.27" layer="95">&gt;NAME</text>
<text x="-15.24" y="-38.1" size="1.27" layer="96">&gt;VALUE</text>
<text x="-10.16" y="-27.94" size="1.27" layer="94">VCC:</text>
<text x="2.54" y="-27.94" size="1.27" layer="94">2.7-5.5V</text>
</symbol>
<symbol name="VMOTOR">
<text x="-1.524" y="1.016" size="1.27" layer="96">&gt;VALUE</text>
<pin name="VMOTOR" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
<wire x1="-1.27" y1="-1.27" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="1.27" y2="-1.27" width="0.254" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="RESISTOR" prefix="R" uservalue="yes">
<description>&lt;p&gt;&lt;b&gt;Resistors&lt;/b&gt;&lt;/p&gt;
&lt;p&gt;For new designs, use the packages preceded by an '_' character since they are more reliable:&lt;/p&gt;
&lt;p&gt;The following footprints should be used on most boards:&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;&lt;b&gt;_0402&lt;/b&gt; - Standard footprint for regular board layouts&lt;/li&gt;
&lt;li&gt;&lt;b&gt;_0603&lt;/b&gt; - Standard footprint for regular board layouts&lt;/li&gt;
&lt;li&gt;&lt;b&gt;_0805&lt;/b&gt; - Standard footprint for regular board layouts&lt;/li&gt;
&lt;li&gt;&lt;b&gt;_1206&lt;/b&gt; - Standard footprint for regular board layouts&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;For extremely tight-pitch boards where space is at a premium, the following 'micro-pitch' footprints can be used (smaller pads, no silkscreen outline, etc.):&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;&lt;b&gt;_0402MP&lt;/b&gt; - Micro-pitch footprint for very dense/compact boards&lt;/li&gt;
&lt;li&gt;&lt;b&gt;_0603MP&lt;/b&gt; - Micro-pitch footprint for very dense/compact boards&lt;/li&gt;
&lt;li&gt;&lt;b&gt;_0805MP&lt;/b&gt; - Micro-pitch footprint for very dense/compact boards&lt;/li&gt;
&lt;li&gt;&lt;b&gt;_1206MP&lt;/b&gt; - Micro-pitch footprint for very dense/compact boards&lt;/li&gt;
&lt;/ul&gt;</description>
<gates>
<gate name="G$1" symbol="RESISTOR" x="0" y="0"/>
</gates>
<devices>
<device name="0603MINI" package="0603-MINI">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="2012" package="2012">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0805_NOTHERMALS" package="0805_NOTHERMALS">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="2512" package="2512">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0402" package="_0402">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0402MP" package="_0402MP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0603" package="_0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0603MP" package="_0603MP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0805" package="_0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0805MP" package="_0805MP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0805_NOOUTLINE" package="0805-NO">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0603_NOOUT" package="0603-NO">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_1206" package="_1206">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_1206MP" package="_1206MP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="3.3V">
<description>&lt;b&gt;3.3V Supply&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="3.3V" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="ESP-12S">
<gates>
<gate name="G$1" symbol="ESP8266-12" x="0" y="0"/>
<gate name="G$2" symbol="THERMAL-SLUG" x="0" y="-27.94"/>
</gates>
<devices>
<device name="" package="ESP-12S">
<connects>
<connect gate="G$1" pin="ADC" pad="2"/>
<connect gate="G$1" pin="CH_PD" pad="3"/>
<connect gate="G$1" pin="GND" pad="9"/>
<connect gate="G$1" pin="GPIO0" pad="12"/>
<connect gate="G$1" pin="GPIO12" pad="6"/>
<connect gate="G$1" pin="GPIO13" pad="7"/>
<connect gate="G$1" pin="GPIO14" pad="5"/>
<connect gate="G$1" pin="GPIO15" pad="10"/>
<connect gate="G$1" pin="GPIO16" pad="4"/>
<connect gate="G$1" pin="GPIO2" pad="11"/>
<connect gate="G$1" pin="GPIO4" pad="13"/>
<connect gate="G$1" pin="GPIO5" pad="14"/>
<connect gate="G$1" pin="RESET" pad="1"/>
<connect gate="G$1" pin="RXD" pad="15"/>
<connect gate="G$1" pin="TXD" pad="16"/>
<connect gate="G$1" pin="VCC" pad="8"/>
<connect gate="G$2" pin="TP" pad="P$1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="CAP_CERAMIC" prefix="C" uservalue="yes">
<description>&lt;p&gt;&lt;b&gt;Ceramic Capacitors&lt;/b&gt;&lt;/p&gt;
&lt;p&gt;For new designs, use the packages preceded by an '_' character since they are more reliable:&lt;/p&gt;
&lt;p&gt;The following footprints should be used on most boards:&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;&lt;b&gt;_0402&lt;/b&gt; - Standard footprint for regular board layouts&lt;/li&gt;
&lt;li&gt;&lt;b&gt;_0603&lt;/b&gt; - Standard footprint for regular board layouts&lt;/li&gt;
&lt;li&gt;&lt;b&gt;_0805&lt;/b&gt; - Standard footprint for regular board layouts&lt;/li&gt;
&lt;li&gt;&lt;b&gt;_1206&lt;/b&gt; - Standard footprint for regular board layouts&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;For extremely tight-pitch boards where space is at a premium, the following 'micro-pitch' footprints can be used (smaller pads, no silkscreen outline, etc.):&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;&lt;b&gt;_0402MP&lt;/b&gt; - Micro-pitch footprint for very dense/compact boards&lt;/li&gt;
&lt;li&gt;&lt;b&gt;_0603MP&lt;/b&gt; - Micro-pitch footprint for very dense/compact boards&lt;/li&gt;
&lt;li&gt;&lt;b&gt;_0805MP&lt;/b&gt; - Micro-pitch footprint for very dense/compact boards&lt;/li&gt;
&lt;li&gt;&lt;b&gt;_1206MP&lt;/b&gt; - Micro-pitch footprint for very dense/compact boards&lt;/li&gt;
&lt;/ul&gt;</description>
<gates>
<gate name="G$1" symbol="CAPACITOR" x="0" y="-2.54"/>
</gates>
<devices>
<device name="0603MINI" package="0603-MINI">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0805-NOTHERMALS" package="0805_NOTHERMALS">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0402" package="_0402">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0402MP" package="_0402MP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0603" package="_0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0603MP" package="_0603MP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0805" package="_0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_0805MP" package="_0805MP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0805-NOOUTLINE" package="0805-NO">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0805_10MGAP" package="0805_10MGAP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0603_NO" package="0603-NO">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_1206" package="_1206">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_1206MP" package="_1206MP">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="GND">
<description>&lt;b&gt;GND&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="VBUS">
<description>&lt;p&gt;VBUS Supply Symbole&lt;/p&gt;</description>
<gates>
<gate name="G$1" symbol="VBUS" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="CP2104" prefix="U" uservalue="yes">
<description>&lt;p&gt;&lt;b&gt;CP2104&lt;/b&gt; - USB to UART Bridge&lt;/p&gt;
&lt;p&gt;
&lt;ul&gt;
&lt;li&gt;VDD Output: 3.45V&lt;/li&gt;
&lt;/ul&gt;
&lt;/p&gt;</description>
<gates>
<gate name="G$1" symbol="CP2104" x="0" y="0"/>
<gate name="G$2" symbol="THERMAL-SLUG" x="27.94" y="-22.86"/>
</gates>
<devices>
<device name="" package="QFN24_4MM_SMSC">
<connects>
<connect gate="G$1" pin="#RST" pad="9"/>
<connect gate="G$1" pin="#SUSPEND" pad="15"/>
<connect gate="G$1" pin="CTS" pad="18"/>
<connect gate="G$1" pin="D+" pad="3"/>
<connect gate="G$1" pin="D-" pad="4"/>
<connect gate="G$1" pin="DCD" pad="24"/>
<connect gate="G$1" pin="DSR" pad="22"/>
<connect gate="G$1" pin="DTR" pad="23"/>
<connect gate="G$1" pin="GND" pad="2"/>
<connect gate="G$1" pin="GPIO0/TXLED" pad="14"/>
<connect gate="G$1" pin="GPIO1/RXLED" pad="13"/>
<connect gate="G$1" pin="GPIO2" pad="12"/>
<connect gate="G$1" pin="GPIO3" pad="11"/>
<connect gate="G$1" pin="NC" pad="10"/>
<connect gate="G$1" pin="REGIN" pad="7"/>
<connect gate="G$1" pin="RI" pad="1"/>
<connect gate="G$1" pin="RTS" pad="19"/>
<connect gate="G$1" pin="RXD" pad="20"/>
<connect gate="G$1" pin="SUSPEND" pad="17"/>
<connect gate="G$1" pin="TXD" pad="21"/>
<connect gate="G$1" pin="VBUS" pad="8"/>
<connect gate="G$1" pin="VDD" pad="6"/>
<connect gate="G$1" pin="VIO" pad="5"/>
<connect gate="G$1" pin="VPP" pad="16"/>
<connect gate="G$2" pin="TP" pad="THERM"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="SWITCH_TACT_SMT" prefix="SW" uservalue="yes">
<description>&lt;p&gt;SMT Tact Switches&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;6x6mm - Digikey: P12940SCT-ND&lt;/li&gt;
&lt;li&gt;KMR2 (4.6x2.8mm) - Digikey: 401-1426-1-ND&lt;/li&gt;
&lt;li&gt;EVQ-PQHB55 - Light Touch, 160GF (4.5x4.5mm) - Digikey: P8090SCT-ND&lt;/li&gt;
&lt;li&gt;KMT0 - KMT021 NGJ LHS (etc.) IP68/Waterproof - Digikey: CKN10289CT-ND&lt;/li&gt;
&lt;/ul&gt;</description>
<gates>
<gate name="G$1" symbol="BUTTON_4PIN" x="0" y="0"/>
</gates>
<devices>
<device name="" package="EVQ-Q2">
<connects>
<connect gate="G$1" pin="P" pad="A"/>
<connect gate="G$1" pin="P1" pad="A'"/>
<connect gate="G$1" pin="S" pad="B"/>
<connect gate="G$1" pin="S1" pad="B'"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="4.6X2.8" package="BTN_KMR2_4.6X2.8">
<connects>
<connect gate="G$1" pin="P" pad="A"/>
<connect gate="G$1" pin="P1" pad="A'"/>
<connect gate="G$1" pin="S" pad="B"/>
<connect gate="G$1" pin="S1" pad="B'"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="EVQPQ" package="BTN_EVQPQ_4.5MM">
<connects>
<connect gate="G$1" pin="P" pad="A"/>
<connect gate="G$1" pin="P1" pad="C"/>
<connect gate="G$1" pin="S" pad="B"/>
<connect gate="G$1" pin="S1" pad="D"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="KMT0" package="BTN_KMT0">
<connects>
<connect gate="G$1" pin="P" pad="A"/>
<connect gate="G$1" pin="P1" pad="A'"/>
<connect gate="G$1" pin="S" pad="B"/>
<connect gate="G$1" pin="S1" pad="B'"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_EVQQ2_SMALL" package="EVQ-Q2_SMALLER">
<connects>
<connect gate="G$1" pin="P" pad="A"/>
<connect gate="G$1" pin="P1" pad="A'"/>
<connect gate="G$1" pin="S" pad="B"/>
<connect gate="G$1" pin="S1" pad="B'"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_12MM" package="B3F-40XX-SMT">
<connects>
<connect gate="G$1" pin="P" pad="P$1"/>
<connect gate="G$1" pin="P1" pad="P$2"/>
<connect gate="G$1" pin="S" pad="P$3"/>
<connect gate="G$1" pin="S1" pad="P$4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="VBAT">
<description>VBAT Supply Sumbol</description>
<gates>
<gate name="G$1" symbol="VBAT" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="VREG_SOT23-5" prefix="U" uservalue="yes">
<description>&lt;p&gt;&lt;b&gt;SOT23-5 Fixed Voltage Regulators&lt;/b&gt;&lt;/p&gt;
&lt;p&gt;&lt;/p&gt;
&lt;table width="700"&gt;
&lt;tr bgcolor="#EEEEEE" &gt;
&lt;td&gt;&lt;b&gt;Part&lt;/b&gt;&lt;/td&gt;
&lt;td&gt;&lt;b&gt;Current Out&lt;/b&gt;&lt;/td&gt;
&lt;td&gt;&lt;b&gt;V Out&lt;/b&gt;&lt;/td&gt;
&lt;td&gt;&lt;b&gt;V In&lt;/b&gt;&lt;/td&gt;
&lt;td&gt;&lt;b&gt;V Dropout&lt;/b&gt;&lt;/td&gt;
&lt;td&gt;&lt;b&gt;θJA (°C/W)&lt;/b&gt;&lt;/td&gt;
&lt;td&gt;&lt;b&gt;TJ (°C)&lt;/b&gt;&lt;/td&gt;
&lt;td&gt;&lt;b&gt;Digikey Part No.&lt;/b&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;ADP121&lt;/td&gt;
  &lt;td&gt;150mA&lt;/td&gt;
  &lt;td&gt;&lt;b&gt;3.3V&lt;/b&gt;&lt;/td&gt;
  &lt;td&gt;3.4-5.5V&lt;/td&gt;
  &lt;td&gt;0.09V @ 150mA&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;ADP121-AUJZ33R7CT-ND&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;ADP121&lt;/td&gt;
  &lt;td&gt;150mA&lt;/td&gt;
  &lt;td&gt;&lt;b&gt;3.0V&lt;/b&gt;&lt;/td&gt;
  &lt;td&gt;3.1-5.5V&lt;/td&gt;
  &lt;td&gt;0.09V @ 150mA&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;ADP121-AUJZ30R7CT-ND&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;ADP122&lt;/td&gt;
  &lt;td&gt;&lt;strong&gt;300mA&lt;/strong&gt;&lt;/td&gt;
  &lt;td&gt;&lt;b&gt;3.3V&lt;/b&gt;&lt;/td&gt;
  &lt;td&gt;3.4-5.5V&lt;/td&gt;
  &lt;td&gt;0.085V @ 300mA&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;ADP122AUJZ-3.3-R7CT-ND&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;ADP1712&lt;/td&gt;
  &lt;td&gt;&lt;strong&gt;300mA&lt;/strong&gt;&lt;/td&gt;
  &lt;td&gt;&lt;b&gt;3.3V&lt;/b&gt;&lt;/td&gt;
  &lt;td&gt;3.5-5.5V&lt;/td&gt;
  &lt;td&gt;0.17V @ 300mA&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;ADP1712AUJZ-3.3-R7TR-ND&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;AP7311 (&lt;b&gt;Low Cost&lt;/b&gt;)&lt;/td&gt;
  &lt;td&gt;150mA&lt;/td&gt;
  &lt;td&gt;&lt;b&gt;3.3V&lt;/b&gt;&lt;/td&gt;
  &lt;td&gt;3.5-6V&lt;/td&gt;
  &lt;td&gt;0.15V @ 150mA&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;AP7311-33WG-7DICT-ND&lt;/td&gt;
&lt;/tr&gt;

&lt;tr&gt;
  &lt;td&gt;LD39015M18R&lt;/td&gt;
  &lt;td&gt;150mA&lt;/td&gt;
  &lt;td&gt;&lt;b&gt;1.8V&lt;/b&gt;&lt;/td&gt;
  &lt;td&gt;1.9V-5.5V&lt;/td&gt;
  &lt;td&gt;0.08V @ 100mA&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;497-6977-1-ND&lt;/td&gt;
&lt;/tr&gt;

&lt;tr&gt;
  &lt;td&gt;LP2985A-33DBVR&lt;/td&gt;
  &lt;td&gt;150mA&lt;/td&gt;
  &lt;td&gt;&lt;b&gt;3.3V&lt;/b&gt;&lt;/td&gt;
  &lt;td&gt;3.3-16V&lt;/td&gt;
  &lt;td&gt;0.28V @ 150mA&lt;/td&gt;
  &lt;td&gt;206&lt;/td&gt;
  &lt;td&gt;150&lt;/td&gt;
  &lt;td&gt;296-18479-1-ND&lt;/td&gt;
&lt;/tr&gt;

&lt;tr&gt;
  &lt;td&gt;MCP1824T-3302E/OT&lt;/td&gt;
  &lt;td&gt;&lt;b&gt;300mA&lt;/b&gt;&lt;/td&gt;
  &lt;td&gt;&lt;b&gt;3.3V&lt;/b&gt;&lt;/td&gt;
  &lt;td&gt;3.5V-6V&lt;/td&gt;
  &lt;td&gt;0.2V @ 300mA&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;MCP1824T-3302E/OTCT-ND&lt;/td&gt;
&lt;/tr&gt;

&lt;tr&gt;
  &lt;td&gt;MIC5205-2.5YM5 TR&lt;/td&gt;
  &lt;td&gt;150mA&lt;/td&gt;
  &lt;td&gt;&lt;b&gt;2.5V&lt;/b&gt;&lt;/td&gt;
  &lt;td&gt;2.7-16V&lt;/td&gt;
  &lt;td&gt;0.165V @ 150mA&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;576-1257-2-ND&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;MIC5205-3.0YM5 TR&lt;/td&gt;
  &lt;td&gt;150mA&lt;/td&gt;
  &lt;td&gt;&lt;b&gt;3.0V&lt;/b&gt;&lt;/td&gt;
  &lt;td&gt;3.2V-16V&lt;/td&gt;
  &lt;td&gt;0.165V @ 150mA&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;576-1258-2-ND&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;MIC5205-3.3YM5 TR&lt;/td&gt;
  &lt;td&gt;150mA&lt;/td&gt;
  &lt;td&gt;&lt;b&gt;3.3V&lt;/b&gt;&lt;/td&gt;
  &lt;td&gt;3.5V-16V&lt;/td&gt;
  &lt;td&gt;0.165V @ 150mA&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;576-1259-2-ND&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;TPS780330220&lt;/td&gt;
  &lt;td&gt;150mA&lt;/td&gt;
  &lt;td&gt;&lt;b&gt;3.3V+2.2V&lt;/b&gt;&lt;/td&gt;
  &lt;td&gt;3.6-5.5V&lt;/td&gt;
  &lt;td&gt;250mV Max&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;296-23332-1-ND&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;TDA3663/N1,135&lt;/td&gt;
  &lt;td&gt;100mA&lt;/td&gt;
  &lt;td&gt;&lt;b&gt;3.3V&lt;/b&gt;&lt;/td&gt;
  &lt;td&gt;3.5-&lt;b&gt;45V&lt;/b&gt;&lt;/td&gt;
  &lt;td&gt;0.18V @ 50mA&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;--&lt;/td&gt;
  &lt;td&gt;568-5343-1-ND&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;/td&gt;
&lt;/tr&gt;
&lt;tr&gt;
  &lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;/td&gt;
  &lt;td&gt;&lt;/td&gt;
&lt;/tr&gt;

&lt;/table&gt;
&lt;p&gt;Max operating temp can be calculated using θJA, TJ (max junction temperature), and power in watts.  Set the "Maximum Ambient Temperature" until it reaches TJ ("Max Junction Temperature"), which is the absolute limit for safe use of the regulator: &lt;a href="http://www.daycounter.com/Calculators/Heat-Sink-Temperature-Calculator.phtml"&gt;Heat Sink Temperature Calculator&lt;/a&gt;&lt;/p&gt;
&lt;p&gt;For example, With 12V source into a 3.3V LP2985 and a 30mA load, we are dissipating (12V-3.3V) * 0.03A = 0.261W.  With a θJA of 206 °C/W, a TJ of 150°C, and 261mW we can safely use the chip without a heat sink up to 75°C (=147.1°C Junction Temperature).&lt;/p&gt;</description>
<gates>
<gate name="G$1" symbol="VREG_SOT23-5" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOT23-5">
<connects>
<connect gate="G$1" pin="EN" pad="3"/>
<connect gate="G$1" pin="GND" pad="2"/>
<connect gate="G$1" pin="IN" pad="1"/>
<connect gate="G$1" pin="OUT" pad="5"/>
<connect gate="G$1" pin="P4" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="DIODE-SCHOTTKY" prefix="D" uservalue="yes">
<gates>
<gate name="G$1" symbol="DIODE-SCHOTTKY" x="0" y="0"/>
</gates>
<devices>
<device name="SMA" package="SMADIODE">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="DO-1N4148" package="DO-1N4148">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SOT23_REFLOW" package="SOT23-R">
<connects>
<connect gate="G$1" pin="A" pad="1"/>
<connect gate="G$1" pin="C" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SOD-523" package="SOD-523">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SOD-323" package="SOD-323">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SOD-123" package="SOD-123">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SOT23_WIDE" package="SOT23-WIDE">
<connects>
<connect gate="G$1" pin="A" pad="1"/>
<connect gate="G$1" pin="C" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="POWERDI" package="POWERDI-5">
<connects>
<connect gate="G$1" pin="A" pad="A1 A2"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="CON_JST_PH_2PIN" prefix="X" uservalue="yes">
<description>JST 2-Pin Right-Angle Connector
&lt;ul&gt;
&lt;li&gt;PH-Series - 4UConnector: 17311&lt;/li&gt;
&lt;li&gt;SH-Series - 4UConnector: 07278&lt;/li&gt;
&lt;/ul&gt;</description>
<gates>
<gate name="G$1" symbol="PINHD2" x="2.54" y="0"/>
</gates>
<devices>
<device name="" package="JSTPH2">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SH2" package="JSTSH2">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PH2_NOTHERMALS" package="JSTPH2_NOTHERMALS">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="LED" prefix="D" uservalue="yes">
<description>&lt;p&gt;&lt;b&gt;LED&lt;/b&gt;&lt;/p&gt;
&lt;b&gt;0603&lt;/b&gt; - 0603 Surface Mount Package
&lt;hr&gt;
&lt;p&gt;&lt;b&gt;&lt;u&gt;2mA:&lt;/u&gt;&lt;/b&gt;&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;Green LED - Low Power (3.9mcd, 2ma, 1.7Vf) - Digikey: 475-2709-2-ND&lt;/li&gt;
&lt;li&gt;Orange LED - Low Power (9.8mcd, 2ma, 1.8Vf) - Digikey: 475-1194-2-ND&lt;/li&gt;
&lt;li&gt;Red LED - Low Power (5mcd, 2ma, 1.8Vf) - Digikey: 475-1195-2-ND&lt;/li&gt;
&lt;li&gt;Yellow LED - Low Power (7mcd, 2ma, 1.8Vf) - Digikey: 475-1196-2-ND&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;&lt;b&gt;&lt;u&gt;5mA:&lt;/u&gt;&lt;/b&gt;&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;Blue LED - Low Power (17mcd, 5ma, 2.9Vf) - Digikey: LNJ937W8CRACT-ND&lt;/li&gt;
&lt;/ul&gt;
&lt;b&gt;0805&lt;/b&gt; - 0805 Surface Mount Package
&lt;hr&gt;
&lt;p&gt;&lt;b&gt;&lt;u&gt;2mA:&lt;/u&gt;&lt;/b&gt;&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;Red LED (8.8mcd, 2mA, 1.8Vf, Clear) - Low Power [Digikey: 475-2510-1-ND]&lt;/li&gt;
&lt;li&gt;Green LED (5mcd, 2mA, 1.8Vf, Clear) - Low Power [Digikey: 475-2730-1-ND]&lt;/li&gt;
&lt;li&gt;Yellow LED (11.3mcd, 2mA, 1.8Vf, Clear) - Low Power [Digikey: 475-2555-1-ND]&lt;/li&gt;
&lt;/ul&gt;
&lt;p&gt;&lt;b&gt;&lt;u&gt;20mA:&lt;/u&gt;&lt;/b&gt;&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;Red LED (104mcd, 20mA, Diffused) - LS R976 [Digikey: 475-1278-6-ND]&lt;/li&gt;
&lt;li&gt;Red LED (12mcd, 20mA, 2.0Vf, Clear) - APT2012EC [Digikey: 754-1128-1-ND]&lt;/li&gt;
&lt;li&gt;Green LED (15mcd, 20mA, 2.2Vf, Clear) - APT2012GC [Digikey: 754-1131-1-ND]&lt;/li&gt;
&lt;li&gt;Orange LED (160mcd, 20mA, 2.1Vf, Clear) - APT2012SECK [Digikey: 754-1130-1-ND]&lt;/li&gt;
&lt;/ul&gt;
&lt;li&gt;&lt;b&gt;1206&lt;/b&gt; - 1206 Surface Mount Package
&lt;hr&gt;
&lt;ul&gt;
&lt;li&gt;Green LED (26mcd, 20mA, Diffused) - LG N971  [Digikey: 475-1407-6-ND]&lt;/li&gt;
&lt;li&gt;Red LED (15mcd, 20mA, Diffused) - LH N974 [Digikey: 475-1416-6-ND]&lt;/li&gt;
&lt;/ul&gt;

&lt;li&gt;&lt;b&gt;Cree&lt;/b&gt; - Cree High-Power Surface Mount LEDs
&lt;hr&gt;
&lt;ul&gt;
&lt;li&gt;XPEBWT-L1-0000-00D50 - White 111lm 350mA 2.9Vf 6200K 110°&lt;/li&gt;
&lt;li&gt;XTEAWT-00-0000-00000LEE3 - White 114lm 350mA 2.85Vf 5000K 115°&lt;/li&gt;
&lt;/ul&gt;

&lt;li&gt;&lt;b&gt;Everlight&lt;/b&gt; - Everlight 45-21 Series Surface Mount LEDs
&lt;hr&gt;
&lt;ul&gt;
&lt;li&gt;45-21/QK2C-B2832AC2CB2/2T - Warm White 2000mcd 20mA 3.25Vf 3050K 120°&lt;/li&gt;
&lt;li&gt;45-21/LK2C-B38452C4CB2/2T - Nuetral White 2000mcd 20mA 3.25Vf 4150K 120°&lt;/li&gt;
&lt;li&gt;45-21/LK2C-B50634C6CB2/2T - Cold White 2200mcd 20mA 3.25Vf 5650K 120°&lt;/li&gt;
&lt;/ul&gt;

&lt;li&gt;&lt;b&gt;PLCC2 Reverse Mount&lt;/b&gt;
&lt;hr&gt;
&lt;ul&gt;
&lt;li&gt;LS T77K-J1L2-1-0-2-R18-Z - Red 11.25mcd 2mA 1.8Vf 630nm 120°&lt;/li&gt;
&lt;li&gt;LO T77K-L1M2-24-Z - Orange 19.6mcd 2mA 1.8Vf 606nm 120°&lt;/li&gt;
&lt;li&gt;LY T77K-K2M1-26-Z - Yellow 15.7mcd 2mA 1.8Vf 587nm 120°&lt;/li&gt;
&lt;/ul&gt;</description>
<gates>
<gate name="G$1" symbol="LED" x="0" y="0"/>
</gates>
<devices>
<device name="1206" package="CHIPLED_1206">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0805" package="CHIPLED_0805">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0603" package="CHIPLED_0603">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0603_NOOUTLINE" package="CHIPLED_0603_NOOUTLINE">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0805_NOOUTLINE" package="CHIPLED_0805_NOOUTLINE">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="XPE2" package="CREE_XLAMP_XPE2">
<connects>
<connect gate="G$1" pin="A" pad="ANODE"/>
<connect gate="G$1" pin="C" pad="CATHODE"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="XTE" package="CREE_XLAMP_XTE">
<connects>
<connect gate="G$1" pin="A" pad="ANODE"/>
<connect gate="G$1" pin="C" pad="CATHODE"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="EV45-21" package="EVERLIGHT_45-21">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PLCC2_REV" package="PLCC2_REVMOUNT">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1206_NOOUTLINE" package="CHIPLED_1206_NOOUTLINE">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="MCP73831/2" prefix="U" uservalue="yes">
<description>&lt;p&gt;&lt;b&gt;MCP73831/2 LIPO Charger&lt;/b&gt;&lt;/p&gt;
&lt;p&gt;
&lt;ul&gt;
&lt;li&gt;VDD: 3.75 - 6V&lt;/li&gt;
&lt;li&gt;Temp -40 - 85°C&lt;/li&gt;
&lt;li&gt;Programmable Charge Rate: 15-500mA&lt;/li&gt;
&lt;/ul&gt;
&lt;/p&gt;
&lt;p&gt;&lt;b&gt;NOTE:&lt;/b&gt; STAT is a tri-state logic output on the MCP73831 and an open-drain output on the MCP73832.&lt;/p&gt;
&lt;p&gt;SOT23-5 with 4.2V output and tri-state logic on STAT = MCP73831T-2ACI/OT&lt;/p&gt;</description>
<gates>
<gate name="G$1" symbol="MCP73831/2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOT23-5">
<connects>
<connect gate="G$1" pin="PROG" pad="5"/>
<connect gate="G$1" pin="STAT" pad="1"/>
<connect gate="G$1" pin="VBAT" pad="3"/>
<connect gate="G$1" pin="VDD" pad="4"/>
<connect gate="G$1" pin="VSS" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="SOLDERJUMPER_CLOSED" prefix="SJ" uservalue="yes">
<description>&lt;b&gt;Solder Jumper - Closed&lt;/b&gt;
&lt;p&gt;These solder jumpers are closed by default&lt;/p&gt;
&lt;ul&gt;
&lt;li&gt;&lt;b&gt;CLOSEDWIRE&lt;/b&gt; - 10 mil trace between pads that can be cut and resoldered later&lt;/li&gt;
&lt;li&gt;&lt;b&gt;CLOSEDPERM&lt;/b&gt; - 63 mil trace between pads for a permanent connection (used to 'bridge' two signals, a shameless hack for Eagle).  Can double as a test point as well (no cream layer)&lt;/li&gt;
&lt;/ul&gt;</description>
<gates>
<gate name="G$1" symbol="SOLDERJUMPER_CLOSED" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOLDERJUMPER_CLOSEDWIRE">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PERM" package="SOLDERJUMPER_CLOSEDPERM">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="USB_C" prefix="X" uservalue="yes">
<description>&lt;p&gt;&lt;b&gt;USB Type-C USB 2.0&lt;/b&gt; Connector&lt;/p&gt;</description>
<gates>
<gate name="G$1" symbol="USB_C" x="0" y="0"/>
</gates>
<devices>
<device name="" package="USB_C_CUSB31-CFM2AX-01-X">
<connects>
<connect gate="G$1" pin="CC1" pad="A5"/>
<connect gate="G$1" pin="CC2" pad="B5"/>
<connect gate="G$1" pin="D+" pad="A6 B6"/>
<connect gate="G$1" pin="D-" pad="A7 B7"/>
<connect gate="G$1" pin="GND" pad="A1B12 B1A12"/>
<connect gate="G$1" pin="SBU1" pad="A8"/>
<connect gate="G$1" pin="SBU2" pad="B8"/>
<connect gate="G$1" pin="VBUS" pad="A4B9 B4A9"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="TB6612FNG" prefix="U" uservalue="yes">
<description>&lt;p&gt;&lt;b&gt;TB6612FNG Dual H-Bridge Motor Driver&lt;/b&gt;&lt;/p&gt;</description>
<gates>
<gate name="G$1" symbol="TB6612FNG" x="0" y="0"/>
</gates>
<devices>
<device name="SSOP" package="SSOP24">
<connects>
<connect gate="G$1" pin="AIN1" pad="21"/>
<connect gate="G$1" pin="AIN2" pad="22"/>
<connect gate="G$1" pin="AOUT1@1" pad="1"/>
<connect gate="G$1" pin="AOUT1@2" pad="2"/>
<connect gate="G$1" pin="AOUT2@1" pad="5"/>
<connect gate="G$1" pin="AOUT2@2" pad="6"/>
<connect gate="G$1" pin="BIN1" pad="17"/>
<connect gate="G$1" pin="BIN2" pad="16"/>
<connect gate="G$1" pin="BOUT1@1" pad="11"/>
<connect gate="G$1" pin="BOUT1@2" pad="12"/>
<connect gate="G$1" pin="BOUT2@1" pad="7"/>
<connect gate="G$1" pin="BOUT2@2" pad="8"/>
<connect gate="G$1" pin="GND@1" pad="18"/>
<connect gate="G$1" pin="PGND1@1" pad="3"/>
<connect gate="G$1" pin="PGND1@2" pad="4"/>
<connect gate="G$1" pin="PGND2@1" pad="9"/>
<connect gate="G$1" pin="PGND2@2" pad="10"/>
<connect gate="G$1" pin="PWMA" pad="23"/>
<connect gate="G$1" pin="PWMB" pad="15"/>
<connect gate="G$1" pin="STBY" pad="19"/>
<connect gate="G$1" pin="VCC" pad="20"/>
<connect gate="G$1" pin="VM@1" pad="24"/>
<connect gate="G$1" pin="VM@2" pad="13"/>
<connect gate="G$1" pin="VM@3" pad="14"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="VMOTOR">
<description>&lt;b&gt;VMOTOR&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="VMOTOR" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply1">
<packages>
</packages>
<symbols>
<symbol name="GND">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="GND" prefix="GND">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="SparkFun">
<description>&lt;h3&gt;SparkFun Electronics' preferred foot prints&lt;/h3&gt;
We've spent an enormous amount of time creating and checking these footprints and parts. If you enjoy using this library, please buy one of our products at www.sparkfun.com.
&lt;br&gt;&lt;br&gt;
&lt;b&gt;Licensing:&lt;/b&gt; CC v3.0 Share-Alike You are welcome to use this library for commercial purposes. For attribution, we ask that when you begin to sell your device using our footprint, you email us with a link to the product being sold. We want bragging rights that we helped (in a very small part) to create your 8th world wonder. We would like the opportunity to feature your device on our homepage.</description>
<packages>
<package name="SOT23">
<description>&lt;b&gt;SOT-23&lt;/b&gt;</description>
<wire x1="1.4224" y1="0.6604" x2="1.4224" y2="-0.6604" width="0.1524" layer="51"/>
<wire x1="1.4224" y1="-0.6604" x2="-1.4224" y2="-0.6604" width="0.1524" layer="51"/>
<wire x1="-1.4224" y1="-0.6604" x2="-1.4224" y2="0.6604" width="0.1524" layer="51"/>
<wire x1="-1.4224" y1="0.6604" x2="1.4224" y2="0.6604" width="0.1524" layer="51"/>
<smd name="3" x="0" y="1.1" dx="1" dy="1.4" layer="1"/>
<smd name="2" x="0.95" y="-1.1" dx="1" dy="1.4" layer="1"/>
<smd name="1" x="-0.95" y="-1.1" dx="1" dy="1.4" layer="1"/>
<text x="-0.889" y="2.032" size="0.4064" layer="25">&gt;NAME</text>
<text x="-1.016" y="-0.1905" size="0.4064" layer="27">&gt;VALUE</text>
<rectangle x1="-0.2286" y1="0.7112" x2="0.2286" y2="1.2954" layer="51"/>
<rectangle x1="0.7112" y1="-1.2954" x2="1.1684" y2="-0.7112" layer="51"/>
<rectangle x1="-1.1684" y1="-1.2954" x2="-0.7112" y2="-0.7112" layer="51"/>
</package>
<package name="SOT23-3">
<wire x1="1.4224" y1="0.6604" x2="1.4224" y2="-0.6604" width="0.1524" layer="51"/>
<wire x1="1.4224" y1="-0.6604" x2="-1.4224" y2="-0.6604" width="0.1524" layer="51"/>
<wire x1="-1.4224" y1="-0.6604" x2="-1.4224" y2="0.6604" width="0.1524" layer="51"/>
<wire x1="-1.4224" y1="0.6604" x2="1.4224" y2="0.6604" width="0.1524" layer="51"/>
<wire x1="-0.8" y1="0.7" x2="-1.4" y2="0.7" width="0.2032" layer="21"/>
<wire x1="-1.4" y1="0.7" x2="-1.4" y2="-0.1" width="0.2032" layer="21"/>
<wire x1="0.8" y1="0.7" x2="1.4" y2="0.7" width="0.2032" layer="21"/>
<wire x1="1.4" y1="0.7" x2="1.4" y2="-0.1" width="0.2032" layer="21"/>
<smd name="3" x="0" y="1.1" dx="0.8" dy="0.9" layer="1"/>
<smd name="2" x="0.95" y="-1" dx="0.8" dy="0.9" layer="1"/>
<smd name="1" x="-0.95" y="-1" dx="0.8" dy="0.9" layer="1"/>
<text x="-0.8255" y="1.778" size="0.4064" layer="25">&gt;NAME</text>
<text x="-1.016" y="-0.1905" size="0.4064" layer="27">&gt;VALUE</text>
</package>
<package name="TO-92">
<description>&lt;b&gt;TO 92&lt;/b&gt;</description>
<wire x1="-2.0946" y1="-1.651" x2="-0.7863" y2="2.5485" width="0.2032" layer="21" curve="-111.098957" cap="flat"/>
<wire x1="0.7863" y1="2.5484" x2="2.0945" y2="-1.651" width="0.2032" layer="21" curve="-111.09954" cap="flat"/>
<wire x1="-2.0945" y1="-1.651" x2="2.0945" y2="-1.651" width="0.2032" layer="21"/>
<wire x1="-2.6549" y1="-0.254" x2="-2.2537" y2="-0.254" width="0.2032" layer="21"/>
<wire x1="-0.2863" y1="-0.254" x2="0.2863" y2="-0.254" width="0.2032" layer="21"/>
<wire x1="2.2537" y1="-0.254" x2="2.6549" y2="-0.254" width="0.2032" layer="21"/>
<pad name="3" x="1.27" y="0" drill="0.8128" diameter="1.8796"/>
<pad name="2" x="0" y="1.905" drill="0.8128" diameter="1.8796"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" diameter="1.8796"/>
<text x="3.175" y="0.635" size="0.4064" layer="25" ratio="10">&gt;NAME</text>
<text x="3.175" y="-1.27" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="SOT223">
<description>&lt;b&gt;SOT-223&lt;/b&gt;</description>
<wire x1="3.2766" y1="1.651" x2="3.2766" y2="-1.651" width="0.2032" layer="21"/>
<wire x1="3.2766" y1="-1.651" x2="-3.2766" y2="-1.651" width="0.2032" layer="21"/>
<wire x1="-3.2766" y1="-1.651" x2="-3.2766" y2="1.651" width="0.2032" layer="21"/>
<wire x1="-3.2766" y1="1.651" x2="3.2766" y2="1.651" width="0.2032" layer="21"/>
<smd name="1" x="-2.3114" y="-3.0988" dx="1.2192" dy="2.2352" layer="1"/>
<smd name="2" x="0" y="-3.0988" dx="1.2192" dy="2.2352" layer="1"/>
<smd name="3" x="2.3114" y="-3.0988" dx="1.2192" dy="2.2352" layer="1"/>
<smd name="4" x="0" y="3.099" dx="3.6" dy="2.2" layer="1"/>
<text x="-0.8255" y="4.5085" size="0.4064" layer="25">&gt;NAME</text>
<text x="-1.0795" y="-0.1905" size="0.4064" layer="27">&gt;VALUE</text>
<rectangle x1="-1.6002" y1="1.8034" x2="1.6002" y2="3.6576" layer="51"/>
<rectangle x1="-0.4318" y1="-3.6576" x2="0.4318" y2="-1.8034" layer="51"/>
<rectangle x1="-2.7432" y1="-3.6576" x2="-1.8796" y2="-1.8034" layer="51"/>
<rectangle x1="1.8796" y1="-3.6576" x2="2.7432" y2="-1.8034" layer="51"/>
<rectangle x1="-1.6002" y1="1.8034" x2="1.6002" y2="3.6576" layer="51"/>
<rectangle x1="-0.4318" y1="-3.6576" x2="0.4318" y2="-1.8034" layer="51"/>
<rectangle x1="-2.7432" y1="-3.6576" x2="-1.8796" y2="-1.8034" layer="51"/>
<rectangle x1="1.8796" y1="-3.6576" x2="2.7432" y2="-1.8034" layer="51"/>
</package>
<package name="SOT89">
<wire x1="2.3" y1="1.3" x2="2.3" y2="-1.3" width="0.2032" layer="21"/>
<wire x1="2.3" y1="-1.3" x2="-2.3" y2="-1.3" width="0.2032" layer="21"/>
<wire x1="-2.3" y1="-1.3" x2="-2.3" y2="1.3" width="0.2032" layer="21"/>
<wire x1="-2.3" y1="1.3" x2="2.3" y2="1.3" width="0.2032" layer="21"/>
<smd name="1" x="-1.5" y="-1.8" dx="0.58" dy="1.2" layer="1"/>
<smd name="2" x="0" y="-1.8" dx="0.58" dy="1.2" layer="1"/>
<smd name="3" x="1.5" y="-1.8" dx="0.58" dy="1.2" layer="1"/>
<smd name="4" x="0" y="1.3" dx="2" dy="2" layer="1"/>
<text x="-2.5185" y="-0.9555" size="0.4064" layer="25" rot="R90">&gt;NAME</text>
<text x="2.9905" y="-1.1295" size="0.4064" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-0.915" y1="0.3034" x2="0.915" y2="2.1576" layer="51"/>
<rectangle x1="-1.74" y1="-2.23" x2="-1.26" y2="-1.27" layer="51"/>
<rectangle x1="-0.24" y1="-2.23" x2="0.24" y2="-1.27" layer="51"/>
<rectangle x1="1.26" y1="-2.23" x2="1.74" y2="-1.27" layer="51"/>
</package>
<package name="TO-92-AMMO">
<wire x1="-2.0946" y1="-1.651" x2="-0.7863" y2="2.5485" width="0.2032" layer="21" curve="-111.098957" cap="flat"/>
<wire x1="0.7863" y1="2.5484" x2="2.0945" y2="-1.651" width="0.2032" layer="21" curve="-111.09954" cap="flat"/>
<wire x1="-2.0945" y1="-1.651" x2="2.0945" y2="-1.651" width="0.2032" layer="21"/>
<wire x1="-0.635" y1="2.54" x2="0.635" y2="2.54" width="0.2032" layer="21" curve="-25.057615"/>
<wire x1="0.635" y1="2.54" x2="1.905" y2="1.905" width="0.2032" layer="21" curve="-28.072487"/>
<wire x1="-1.905" y1="1.905" x2="0.635" y2="2.54" width="0.2032" layer="21" curve="-53.130102"/>
<pad name="3" x="2.54" y="0" drill="0.8128" diameter="1.8796"/>
<pad name="2" x="0" y="0" drill="0.8128" diameter="1.8796"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" diameter="1.8796"/>
<text x="3.175" y="1.905" size="0.4064" layer="25" ratio="10">&gt;NAME</text>
<text x="3.175" y="-1.905" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="NPN">
<wire x1="2.54" y1="2.54" x2="0.508" y2="1.524" width="0.1524" layer="94"/>
<wire x1="1.778" y1="-1.524" x2="2.54" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="1.27" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="1.778" y2="-1.524" width="0.1524" layer="94"/>
<wire x1="1.54" y1="-2.04" x2="0.308" y2="-1.424" width="0.1524" layer="94"/>
<wire x1="1.524" y1="-2.413" x2="2.286" y2="-2.413" width="0.254" layer="94"/>
<wire x1="2.286" y1="-2.413" x2="1.778" y2="-1.778" width="0.254" layer="94"/>
<wire x1="1.778" y1="-1.778" x2="1.524" y2="-2.286" width="0.254" layer="94"/>
<wire x1="1.524" y1="-2.286" x2="1.905" y2="-2.286" width="0.254" layer="94"/>
<wire x1="1.905" y1="-2.286" x2="1.778" y2="-2.032" width="0.254" layer="94"/>
<text x="5.08" y="0" size="1.778" layer="95">&gt;NAME</text>
<text x="5.08" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<rectangle x1="-0.254" y1="-2.54" x2="0.508" y2="2.54" layer="94"/>
<pin name="B" x="-2.54" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
<pin name="E" x="2.54" y="-5.08" visible="off" length="short" direction="pas" swaplevel="3" rot="R90"/>
<pin name="C" x="2.54" y="5.08" visible="off" length="short" direction="pas" swaplevel="2" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="TRANSISTOR_NPN" prefix="Q" uservalue="yes">
<description>&lt;b&gt;Transistor NPN&lt;/b&gt;
BJT configuration in SOT23 package. MMBT2222 is the common NPN we use. Double check BCE configuration again layout.</description>
<gates>
<gate name="G$1" symbol="NPN" x="0" y="0"/>
</gates>
<devices>
<device name="SOT23" package="SOT23">
<connects>
<connect gate="G$1" pin="B" pad="1"/>
<connect gate="G$1" pin="C" pad="3"/>
<connect gate="G$1" pin="E" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SOT23-3" package="SOT23-3">
<connects>
<connect gate="G$1" pin="B" pad="1"/>
<connect gate="G$1" pin="C" pad="3"/>
<connect gate="G$1" pin="E" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TO92" package="TO-92">
<connects>
<connect gate="G$1" pin="B" pad="2"/>
<connect gate="G$1" pin="C" pad="3"/>
<connect gate="G$1" pin="E" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="&quot;" package="SOT223">
<connects>
<connect gate="G$1" pin="B" pad="1"/>
<connect gate="G$1" pin="C" pad="2"/>
<connect gate="G$1" pin="E" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SOT89" package="SOT89">
<connects>
<connect gate="G$1" pin="B" pad="1"/>
<connect gate="G$1" pin="C" pad="2"/>
<connect gate="G$1" pin="E" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TO-92-AMMO" package="TO-92-AMMO">
<connects>
<connect gate="G$1" pin="B" pad="2"/>
<connect gate="G$1" pin="C" pad="3"/>
<connect gate="G$1" pin="E" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="adafruit">
<packages>
<package name="1X06">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="1.27" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-1.27" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="1.27" x2="-5.715" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="1.27" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-0.635" x2="-5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.27" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-1.27" x2="-5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="0.635" x2="-7.62" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="1.27" x2="-7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-0.635" x2="-6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-1.27" x2="-6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="1.27" x2="6.985" y2="1.27" width="0.1524" layer="21"/>
<wire x1="6.985" y1="1.27" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="0.635" x2="7.62" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-0.635" x2="6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="1.27" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="6.985" y1="-1.27" x2="5.715" y2="-1.27" width="0.1524" layer="21"/>
<pad name="1" x="-6.35" y="0" drill="1.016" shape="octagon" rot="R90"/>
<pad name="2" x="-3.81" y="0" drill="1.016" shape="octagon" rot="R90"/>
<pad name="3" x="-1.27" y="0" drill="1.016" shape="octagon" rot="R90"/>
<pad name="4" x="1.27" y="0" drill="1.016" shape="octagon" rot="R90"/>
<pad name="5" x="3.81" y="0" drill="1.016" shape="octagon" rot="R90"/>
<pad name="6" x="6.35" y="0" drill="1.016" shape="octagon" rot="R90"/>
<text x="-7.6962" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-7.62" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="3.556" y1="-0.254" x2="4.064" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="-4.064" y1="-0.254" x2="-3.556" y2="0.254" layer="51"/>
<rectangle x1="-6.604" y1="-0.254" x2="-6.096" y2="0.254" layer="51"/>
<rectangle x1="6.096" y1="-0.254" x2="6.604" y2="0.254" layer="51"/>
</package>
<package name="1X06-CLEAN">
<pad name="1" x="-6.35" y="0" drill="1.016" shape="octagon" rot="R90"/>
<pad name="2" x="-3.81" y="0" drill="1.016" shape="octagon" rot="R90"/>
<pad name="3" x="-1.27" y="0" drill="1.016" shape="octagon" rot="R90"/>
<pad name="4" x="1.27" y="0" drill="1.016" shape="octagon" rot="R90"/>
<pad name="5" x="3.81" y="0" drill="1.016" shape="octagon" rot="R90"/>
<pad name="6" x="6.35" y="0" drill="1.016" shape="octagon" rot="R90"/>
<text x="-7.6962" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-7.62" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="3.556" y1="-0.254" x2="4.064" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="-4.064" y1="-0.254" x2="-3.556" y2="0.254" layer="51"/>
<rectangle x1="-6.604" y1="-0.254" x2="-6.096" y2="0.254" layer="51"/>
<rectangle x1="6.096" y1="-0.254" x2="6.604" y2="0.254" layer="51"/>
</package>
<package name="1X06-CLEANBIG">
<pad name="1" x="-6.35" y="0" drill="1.016" diameter="1.778" shape="octagon" rot="R90"/>
<pad name="2" x="-3.81" y="0" drill="1.016" diameter="1.778" shape="octagon" rot="R90"/>
<pad name="3" x="-1.27" y="0" drill="1.016" diameter="1.778" shape="octagon" rot="R90"/>
<pad name="4" x="1.27" y="0" drill="1.016" diameter="1.778" shape="octagon" rot="R90"/>
<pad name="5" x="3.81" y="0" drill="1.016" diameter="1.778" shape="octagon" rot="R90"/>
<pad name="6" x="6.35" y="0" drill="1.016" diameter="1.778" shape="octagon" rot="R90"/>
<text x="-7.6962" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-7.62" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="3.556" y1="-0.254" x2="4.064" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="-4.064" y1="-0.254" x2="-3.556" y2="0.254" layer="51"/>
<rectangle x1="-6.604" y1="-0.254" x2="-6.096" y2="0.254" layer="51"/>
<rectangle x1="6.096" y1="-0.254" x2="6.604" y2="0.254" layer="51"/>
</package>
<package name="1X06-BIG">
<wire x1="-7.62" y1="1.27" x2="7.62" y2="1.27" width="0.127" layer="21"/>
<wire x1="7.62" y1="1.27" x2="7.62" y2="-1.27" width="0.127" layer="21"/>
<wire x1="7.62" y1="-1.27" x2="-7.62" y2="-1.27" width="0.127" layer="21"/>
<wire x1="-7.62" y1="-1.27" x2="-7.62" y2="1.27" width="0.127" layer="21"/>
<pad name="1" x="-6.35" y="0" drill="1.016" diameter="1.778" shape="octagon" rot="R90"/>
<pad name="2" x="-3.81" y="0" drill="1.016" diameter="1.778" shape="octagon" rot="R90"/>
<pad name="3" x="-1.27" y="0" drill="1.016" diameter="1.778" shape="octagon" rot="R90"/>
<pad name="4" x="1.27" y="0" drill="1.016" diameter="1.778" shape="octagon" rot="R90"/>
<pad name="5" x="3.81" y="0" drill="1.016" diameter="1.778" shape="octagon" rot="R90"/>
<pad name="6" x="6.35" y="0" drill="1.016" diameter="1.778" shape="octagon" rot="R90"/>
<text x="-7.6962" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-7.62" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="3.556" y1="-0.254" x2="4.064" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="-4.064" y1="-0.254" x2="-3.556" y2="0.254" layer="51"/>
<rectangle x1="-6.604" y1="-0.254" x2="-6.096" y2="0.254" layer="51"/>
<rectangle x1="6.096" y1="-0.254" x2="6.604" y2="0.254" layer="51"/>
</package>
<package name="1X06-BIGLOCK">
<wire x1="-7.62" y1="1.27" x2="7.62" y2="1.27" width="0.127" layer="21"/>
<wire x1="7.62" y1="1.27" x2="7.62" y2="-1.27" width="0.127" layer="21"/>
<wire x1="7.62" y1="-1.27" x2="-7.62" y2="-1.27" width="0.127" layer="21"/>
<wire x1="-7.62" y1="-1.27" x2="-7.62" y2="1.27" width="0.127" layer="21"/>
<pad name="1" x="-6.35" y="0.127" drill="1.016" diameter="1.778" shape="octagon" rot="R90"/>
<pad name="2" x="-3.81" y="-0.127" drill="1.016" diameter="1.778" shape="octagon" rot="R90"/>
<pad name="3" x="-1.27" y="0.127" drill="1.016" diameter="1.778" shape="octagon" rot="R90"/>
<pad name="4" x="1.27" y="-0.127" drill="1.016" diameter="1.778" shape="octagon" rot="R90"/>
<pad name="5" x="3.81" y="0.127" drill="1.016" diameter="1.778" shape="octagon" rot="R90"/>
<pad name="6" x="6.35" y="-0.127" drill="1.016" diameter="1.778" shape="octagon" rot="R90"/>
<text x="-7.6962" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-7.62" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="3.556" y1="-0.254" x2="4.064" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="-4.064" y1="-0.254" x2="-3.556" y2="0.254" layer="51"/>
<rectangle x1="-6.604" y1="-0.254" x2="-6.096" y2="0.254" layer="51"/>
<rectangle x1="6.096" y1="-0.254" x2="6.604" y2="0.254" layer="51"/>
</package>
<package name="1X06-3.5MM">
<wire x1="-10.5" y1="3.4" x2="-10.5" y2="-2.5" width="0.127" layer="21"/>
<wire x1="-10.5" y1="-2.5" x2="-10.5" y2="-3.6" width="0.127" layer="21"/>
<wire x1="-10.5" y1="-3.6" x2="10.5" y2="-3.6" width="0.127" layer="21"/>
<wire x1="10.5" y1="-3.6" x2="10.5" y2="-2.5" width="0.127" layer="21"/>
<wire x1="10.5" y1="-2.5" x2="10.5" y2="3.4" width="0.127" layer="21"/>
<wire x1="10.5" y1="3.4" x2="-10.5" y2="3.4" width="0.127" layer="21"/>
<wire x1="-10.5" y1="-2.5" x2="10.5" y2="-2.5" width="0.127" layer="21"/>
<pad name="5" x="5.25" y="0" drill="1" diameter="2.1844"/>
<pad name="4" x="1.75" y="0" drill="1" diameter="2.1844"/>
<pad name="3" x="-1.75" y="0" drill="1" diameter="2.1844"/>
<pad name="2" x="-5.25" y="0" drill="1" diameter="2.1844"/>
<pad name="1" x="-8.75" y="0" drill="1" diameter="2.1844"/>
<pad name="6" x="8.75" y="0" drill="1" diameter="2.1844"/>
<text x="7.87" y="-5.81" size="1.27" layer="25" rot="R180">&gt;NAME</text>
</package>
</packages>
<symbols>
<symbol name="PINHD6">
<wire x1="-6.35" y1="-7.62" x2="1.27" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-7.62" x2="1.27" y2="10.16" width="0.4064" layer="94"/>
<wire x1="1.27" y1="10.16" x2="-6.35" y2="10.16" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="10.16" x2="-6.35" y2="-7.62" width="0.4064" layer="94"/>
<text x="-6.35" y="10.795" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-10.16" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="7.62" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="5" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="6" x="-2.54" y="-5.08" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PINHD-1X6" prefix="JP" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINHD6" x="0" y="-2.54"/>
</gates>
<devices>
<device name="" package="1X06">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CLEAN" package="1X06-CLEAN">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CB" package="1X06-CLEANBIG">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="B" package="1X06-BIG">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="LOCK" package="1X06-BIGLOCK">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-3.5MM" package="1X06-3.5MM">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="X2" library="microbuilder" deviceset="ESP-12S" device="" value="ESP-12"/>
<part name="U$2" library="microbuilder" deviceset="3.3V" device=""/>
<part name="GND3" library="supply1" deviceset="GND" device=""/>
<part name="R1" library="microbuilder" deviceset="RESISTOR" device="_0603_NOOUT" value="10K"/>
<part name="U$4" library="microbuilder" deviceset="3.3V" device=""/>
<part name="R6" library="microbuilder" deviceset="RESISTOR" device="_0603_NOOUT" value="4.7K"/>
<part name="GND2" library="supply1" deviceset="GND" device=""/>
<part name="R9" library="microbuilder" deviceset="RESISTOR" device="_0603_NOOUT" value="10K"/>
<part name="U$8" library="microbuilder" deviceset="3.3V" device=""/>
<part name="R4" library="microbuilder" deviceset="RESISTOR" device="_0603_NOOUT" value="10K"/>
<part name="R5" library="microbuilder" deviceset="RESISTOR" device="_0603_NOOUT" value="10K"/>
<part name="Q1" library="SparkFun" deviceset="TRANSISTOR_NPN" device="SOT23-3" value="mmbt2222"/>
<part name="Q2" library="SparkFun" deviceset="TRANSISTOR_NPN" device="SOT23-3" value="mmbt2222"/>
<part name="R11" library="microbuilder" deviceset="RESISTOR" device="_0603MP" value="1K"/>
<part name="GND1" library="supply1" deviceset="GND" device=""/>
<part name="C7" library="microbuilder" deviceset="CAP_CERAMIC" device="0603_NO" value="1uF"/>
<part name="U$28" library="microbuilder" deviceset="GND" device=""/>
<part name="IC1" library="microbuilder" deviceset="CP2104" device="" value="CP2104"/>
<part name="U$12" library="microbuilder" deviceset="GND" device=""/>
<part name="U$18" library="microbuilder" deviceset="VBUS" device=""/>
<part name="U$1" library="microbuilder" deviceset="GND" device=""/>
<part name="R3" library="microbuilder" deviceset="RESISTOR" device="_0603_NOOUT" value="10K"/>
<part name="U$5" library="microbuilder" deviceset="3.3V" device=""/>
<part name="SW2" library="microbuilder" deviceset="SWITCH_TACT_SMT" device="4.6X2.8" value="KMR2"/>
<part name="GND6" library="supply1" deviceset="GND" device=""/>
<part name="C6" library="microbuilder" deviceset="CAP_CERAMIC" device="0805-NOOUTLINE" value="10µF"/>
<part name="U$27" library="microbuilder" deviceset="GND" device=""/>
<part name="C8" library="microbuilder" deviceset="CAP_CERAMIC" device="0805-NOOUTLINE" value="10µF"/>
<part name="U$29" library="microbuilder" deviceset="GND" device=""/>
<part name="U$30" library="microbuilder" deviceset="GND" device=""/>
<part name="U$3" library="microbuilder" deviceset="VBUS" device=""/>
<part name="U$21" library="microbuilder" deviceset="VBAT" device=""/>
<part name="U2" library="microbuilder" deviceset="VREG_SOT23-5" device="" value="AP2112-3.3"/>
<part name="D4" library="microbuilder" deviceset="DIODE-SCHOTTKY" device="SOD-123" value="MBR120"/>
<part name="X1" library="microbuilder" deviceset="CON_JST_PH_2PIN" device="" value="JSTPH"/>
<part name="U$16" library="microbuilder" deviceset="VBAT" device=""/>
<part name="U$22" library="microbuilder" deviceset="GND" device=""/>
<part name="U$10" library="microbuilder" deviceset="3.3V" device=""/>
<part name="C2" library="microbuilder" deviceset="CAP_CERAMIC" device="0805-NOOUTLINE" value="10uF"/>
<part name="U$17" library="microbuilder" deviceset="GND" device=""/>
<part name="R7" library="microbuilder" deviceset="RESISTOR" device="_0603_NOOUT" value="10K"/>
<part name="U$24" library="microbuilder" deviceset="3.3V" device=""/>
<part name="U3" library="microbuilder" deviceset="MCP73831/2" device="" value="MCP73831T-2ACI/OT"/>
<part name="CHG" library="microbuilder" deviceset="LED" device="0805_NOOUTLINE" value="ORANGE"/>
<part name="R2" library="microbuilder" deviceset="RESISTOR" device="_0603_NOOUT" value="1K"/>
<part name="C3" library="microbuilder" deviceset="CAP_CERAMIC" device="0805-NOOUTLINE" value="10µF"/>
<part name="U$33" library="microbuilder" deviceset="GND" device=""/>
<part name="R8" library="microbuilder" deviceset="RESISTOR" device="_0603_NOOUT" value="10K\"/>
<part name="U$36" library="microbuilder" deviceset="GND" device=""/>
<part name="U$38" library="microbuilder" deviceset="VBUS" device=""/>
<part name="U$39" library="microbuilder" deviceset="VBAT" device=""/>
<part name="SJ1" library="microbuilder" deviceset="SOLDERJUMPER_CLOSED" device=""/>
<part name="D3" library="microbuilder" deviceset="LED" device="0805_NOOUTLINE" value="RED"/>
<part name="U$14" library="microbuilder" deviceset="3.3V" device=""/>
<part name="R10" library="microbuilder" deviceset="RESISTOR" device="_0603_NOOUT" value="1K"/>
<part name="X3" library="microbuilder" deviceset="USB_C" device=""/>
<part name="U$6" library="microbuilder" deviceset="GND" device=""/>
<part name="R12" library="microbuilder" deviceset="RESISTOR" device="_0603_NOOUT" value="5.1K"/>
<part name="R13" library="microbuilder" deviceset="RESISTOR" device="_0603_NOOUT" value="5.1K"/>
<part name="U$7" library="microbuilder" deviceset="GND" device=""/>
<part name="U$9" library="microbuilder" deviceset="GND" device=""/>
<part name="U1" library="microbuilder" deviceset="TB6612FNG" device="SSOP" value="TB6612 SSOP"/>
<part name="U$11" library="microbuilder" deviceset="VMOTOR" device=""/>
<part name="U$13" library="microbuilder" deviceset="VMOTOR" device=""/>
<part name="C1" library="microbuilder" deviceset="CAP_CERAMIC" device="0805-NOOUTLINE" value="10µF"/>
<part name="JP3" library="adafruit" deviceset="PINHD-1X6" device="CB"/>
<part name="R14" library="microbuilder" deviceset="RESISTOR" device="0805_NOOUTLINE" value="10K"/>
<part name="GND4" library="supply1" deviceset="GND" device=""/>
<part name="GND5" library="supply1" deviceset="GND" device=""/>
<part name="GND7" library="supply1" deviceset="GND" device=""/>
<part name="GND8" library="supply1" deviceset="GND" device=""/>
<part name="U$15" library="microbuilder" deviceset="3.3V" device=""/>
<part name="U$19" library="microbuilder" deviceset="3.3V" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<text x="12.7" y="180.34" size="1.778" layer="94">USB TO SERIAL CONVERTER</text>
<text x="-66.04" y="165.1" size="1.778" layer="94">RESET</text>
<text x="-137.16" y="165.1" size="1.778" layer="94">POWER AND FILTERING</text>
<text x="-104.14" y="99.06" size="1.778" layer="97">10K  = 100mA</text>
<text x="-104.14" y="96.52" size="1.778" layer="97">5.0K  = 200mA</text>
<text x="-104.14" y="93.98" size="1.778" layer="97">2.0K  = 500mA</text>
<text x="-104.14" y="91.44" size="1.778" layer="97">1.0K  = 1000mA</text>
<text x="-129.54" y="101.6" size="1.778" layer="94">LIPO CHARGING</text>
<text x="-63.5" y="106.68" size="1.778" layer="94">LED</text>
</plain>
<instances>
<instance part="X2" gate="G$1" x="-12.7" y="71.12" smashed="yes"/>
<instance part="U$2" gate="G$1" x="-33.02" y="58.42" smashed="yes" rot="R90">
<attribute name="VALUE" x="-34.036" y="56.896" size="1.27" layer="96" rot="R90"/>
</instance>
<instance part="GND3" gate="1" x="5.08" y="50.8" smashed="yes">
<attribute name="VALUE" x="2.54" y="48.26" size="1.778" layer="96"/>
</instance>
<instance part="R1" gate="G$1" x="55.88" y="91.44" smashed="yes" rot="R90">
<attribute name="NAME" x="53.34" y="91.44" size="1.27" layer="95" font="vector" rot="R90" align="center"/>
<attribute name="VALUE" x="55.88" y="91.44" size="1.016" layer="96" font="vector" ratio="15" rot="R90" align="center"/>
</instance>
<instance part="U$4" gate="G$1" x="55.88" y="104.14" smashed="yes">
<attribute name="VALUE" x="54.356" y="105.156" size="1.27" layer="96"/>
</instance>
<instance part="R6" gate="G$1" x="63.5" y="86.36" smashed="yes" rot="R90">
<attribute name="NAME" x="60.96" y="86.36" size="1.27" layer="95" font="vector" rot="R90" align="center"/>
<attribute name="VALUE" x="63.5" y="86.36" size="1.016" layer="96" font="vector" ratio="15" rot="R90" align="center"/>
</instance>
<instance part="GND2" gate="1" x="63.5" y="76.2" smashed="yes">
<attribute name="VALUE" x="60.96" y="73.66" size="1.778" layer="96"/>
</instance>
<instance part="R9" gate="G$1" x="48.26" y="91.44" smashed="yes" rot="R90">
<attribute name="NAME" x="45.72" y="91.44" size="1.27" layer="95" font="vector" rot="R90" align="center"/>
<attribute name="VALUE" x="48.26" y="91.44" size="1.016" layer="96" font="vector" ratio="15" rot="R90" align="center"/>
</instance>
<instance part="U$8" gate="G$1" x="48.26" y="104.14" smashed="yes">
<attribute name="VALUE" x="46.736" y="105.156" size="1.27" layer="96"/>
</instance>
<instance part="R4" gate="G$1" x="53.34" y="50.8" smashed="yes">
<attribute name="NAME" x="53.34" y="53.34" size="1.27" layer="95" font="vector" align="center"/>
<attribute name="VALUE" x="53.34" y="50.8" size="1.016" layer="96" font="vector" ratio="15" align="center"/>
</instance>
<instance part="R5" gate="G$1" x="53.34" y="68.58" smashed="yes">
<attribute name="NAME" x="53.34" y="71.12" size="1.27" layer="95" font="vector" align="center"/>
<attribute name="VALUE" x="53.34" y="68.58" size="1.016" layer="96" font="vector" ratio="15" align="center"/>
</instance>
<instance part="Q1" gate="G$1" x="66.04" y="50.8" smashed="yes" rot="MR180">
<attribute name="NAME" x="71.12" y="50.8" size="1.778" layer="95" rot="MR180"/>
<attribute name="VALUE" x="71.12" y="53.34" size="1.778" layer="96" rot="MR180"/>
</instance>
<instance part="Q2" gate="G$1" x="66.04" y="68.58" smashed="yes">
<attribute name="NAME" x="71.12" y="68.58" size="1.778" layer="95"/>
<attribute name="VALUE" x="71.12" y="66.04" size="1.778" layer="96"/>
</instance>
<instance part="R11" gate="G$1" x="27.94" y="73.66" smashed="yes" rot="R180">
<attribute name="NAME" x="27.94" y="71.12" size="1.27" layer="95" font="vector" rot="R180" align="center"/>
<attribute name="VALUE" x="27.94" y="73.66" size="1.016" layer="96" font="vector" ratio="15" rot="R180" align="center"/>
</instance>
<instance part="X2" gate="G$2" x="-33.02" y="96.52" smashed="yes">
<attribute name="NAME" x="-38.1" y="102.87" size="1.778" layer="95"/>
</instance>
<instance part="GND1" gate="1" x="-33.02" y="86.36" smashed="yes">
<attribute name="VALUE" x="-35.56" y="83.82" size="1.778" layer="96"/>
</instance>
<instance part="C7" gate="G$1" x="-10.16" y="157.48" smashed="yes">
<attribute name="NAME" x="-12.45" y="158.73" size="1.27" layer="95" font="vector" rot="R90" align="center"/>
<attribute name="VALUE" x="-7.86" y="158.73" size="1.27" layer="96" font="vector" rot="R90" align="center"/>
</instance>
<instance part="U$28" gate="G$1" x="-10.16" y="149.86" smashed="yes">
<attribute name="VALUE" x="-11.684" y="147.32" size="1.27" layer="96"/>
</instance>
<instance part="IC1" gate="G$1" x="27.94" y="144.78" smashed="yes">
<attribute name="NAME" x="15.24" y="173.99" size="1.27" layer="95"/>
<attribute name="VALUE" x="15.24" y="111.76" size="1.27" layer="96"/>
</instance>
<instance part="U$12" gate="G$1" x="10.16" y="144.78" smashed="yes">
<attribute name="VALUE" x="8.636" y="142.24" size="1.27" layer="96"/>
</instance>
<instance part="U$18" gate="G$1" x="-2.54" y="144.78" smashed="yes">
<attribute name="VALUE" x="-4.064" y="145.796" size="1.27" layer="96"/>
</instance>
<instance part="IC1" gate="G$2" x="68.58" y="132.08" smashed="yes">
<attribute name="NAME" x="63.5" y="138.43" size="1.778" layer="95"/>
</instance>
<instance part="U$1" gate="G$1" x="68.58" y="121.92" smashed="yes">
<attribute name="VALUE" x="67.056" y="119.38" size="1.27" layer="96"/>
</instance>
<instance part="R3" gate="G$1" x="-60.96" y="152.4" smashed="yes" rot="R90">
<attribute name="NAME" x="-63.5" y="152.4" size="1.27" layer="95" font="vector" rot="R90" align="center"/>
<attribute name="VALUE" x="-60.96" y="152.4" size="1.016" layer="96" font="vector" ratio="15" rot="R90" align="center"/>
</instance>
<instance part="U$5" gate="G$1" x="-60.96" y="160.02" smashed="yes">
<attribute name="VALUE" x="-62.484" y="161.036" size="1.27" layer="96"/>
</instance>
<instance part="SW2" gate="G$1" x="-63.5" y="132.08" smashed="yes" rot="R90">
<attribute name="NAME" x="-69.85" y="129.54" size="1.27" layer="95" rot="R90"/>
<attribute name="VALUE" x="-58.42" y="129.54" size="1.27" layer="96" rot="R90"/>
</instance>
<instance part="GND6" gate="1" x="-60.96" y="121.92" smashed="yes">
<attribute name="VALUE" x="-63.5" y="119.38" size="1.778" layer="96"/>
</instance>
<instance part="C6" gate="G$1" x="-147.32" y="132.08" smashed="yes">
<attribute name="NAME" x="-149.61" y="133.33" size="1.27" layer="95" font="vector" rot="R90" align="center"/>
<attribute name="VALUE" x="-145.02" y="133.33" size="1.27" layer="96" font="vector" rot="R90" align="center"/>
</instance>
<instance part="U$27" gate="G$1" x="-147.32" y="124.46" smashed="yes">
<attribute name="VALUE" x="-148.844" y="121.92" size="1.27" layer="96"/>
</instance>
<instance part="C8" gate="G$1" x="-114.3" y="132.08" smashed="yes">
<attribute name="NAME" x="-116.59" y="133.33" size="1.27" layer="95" font="vector" rot="R90" align="center"/>
<attribute name="VALUE" x="-112" y="133.33" size="1.27" layer="96" font="vector" rot="R90" align="center"/>
</instance>
<instance part="U$29" gate="G$1" x="-114.3" y="124.46" smashed="yes">
<attribute name="VALUE" x="-115.824" y="121.92" size="1.27" layer="96"/>
</instance>
<instance part="U$30" gate="G$1" x="-137.16" y="124.46" smashed="yes">
<attribute name="VALUE" x="-138.684" y="121.92" size="1.27" layer="96"/>
</instance>
<instance part="U$3" gate="G$1" x="-154.94" y="160.02" smashed="yes">
<attribute name="VALUE" x="-156.464" y="161.036" size="1.27" layer="96"/>
</instance>
<instance part="U$21" gate="G$1" x="-147.32" y="160.02" smashed="yes">
<attribute name="VALUE" x="-148.844" y="161.036" size="1.27" layer="96"/>
</instance>
<instance part="U2" gate="G$1" x="-127" y="142.24" smashed="yes">
<attribute name="NAME" x="-134.62" y="148.336" size="1.27" layer="95"/>
<attribute name="VALUE" x="-134.62" y="134.62" size="1.27" layer="95"/>
</instance>
<instance part="D4" gate="G$1" x="-147.32" y="152.4" smashed="yes" rot="R270">
<attribute name="NAME" x="-144.78" y="152.4" size="1.27" layer="95" rot="R270" align="center"/>
<attribute name="VALUE" x="-149.82" y="152.4" size="1.27" layer="96" rot="R270" align="center"/>
</instance>
<instance part="X1" gate="G$1" x="-93.98" y="137.16" smashed="yes" rot="R180">
<attribute name="NAME" x="-87.63" y="131.445" size="1.778" layer="95" rot="R180"/>
<attribute name="VALUE" x="-87.63" y="142.24" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="U$16" gate="G$1" x="-91.44" y="147.32" smashed="yes">
<attribute name="VALUE" x="-92.964" y="148.336" size="1.27" layer="96"/>
</instance>
<instance part="U$22" gate="G$1" x="-91.44" y="124.46" smashed="yes">
<attribute name="VALUE" x="-92.964" y="121.92" size="1.27" layer="96"/>
</instance>
<instance part="U$10" gate="G$1" x="-106.68" y="149.86" smashed="yes">
<attribute name="VALUE" x="-108.204" y="150.876" size="1.27" layer="96"/>
</instance>
<instance part="C2" gate="G$1" x="-106.68" y="132.08" smashed="yes">
<attribute name="NAME" x="-108.97" y="133.33" size="1.27" layer="95" font="vector" rot="R90" align="center"/>
<attribute name="VALUE" x="-104.38" y="133.33" size="1.27" layer="96" font="vector" rot="R90" align="center"/>
</instance>
<instance part="U$17" gate="G$1" x="-106.68" y="124.46" smashed="yes">
<attribute name="VALUE" x="-108.204" y="121.92" size="1.27" layer="96"/>
</instance>
<instance part="R7" gate="G$1" x="-142.24" y="139.7" smashed="yes" rot="R90">
<attribute name="NAME" x="-144.78" y="139.7" size="1.27" layer="95" font="vector" rot="R90" align="center"/>
<attribute name="VALUE" x="-142.24" y="139.7" size="1.016" layer="96" font="vector" ratio="15" rot="R90" align="center"/>
</instance>
<instance part="U$24" gate="G$1" x="-106.68" y="139.7" smashed="yes">
<attribute name="VALUE" x="-108.204" y="140.716" size="1.27" layer="96"/>
</instance>
<instance part="U3" gate="G$1" x="-119.38" y="83.82" smashed="yes">
<attribute name="NAME" x="-129.54" y="95.25" size="1.27" layer="95"/>
<attribute name="VALUE" x="-129.54" y="71.12" size="1.27" layer="95"/>
</instance>
<instance part="CHG" gate="G$1" x="-152.4" y="81.28" smashed="yes">
<attribute name="NAME" x="-153.67" y="85.725" size="1.27" layer="95" align="center"/>
<attribute name="VALUE" x="-153.67" y="78.486" size="1.27" layer="96" align="center"/>
</instance>
<instance part="R2" gate="G$1" x="-142.24" y="81.28" smashed="yes">
<attribute name="NAME" x="-142.24" y="83.82" size="1.27" layer="95" font="vector" align="center"/>
<attribute name="VALUE" x="-142.24" y="81.28" size="1.016" layer="96" font="vector" ratio="15" align="center"/>
</instance>
<instance part="C3" gate="G$1" x="-86.36" y="78.74" smashed="yes">
<attribute name="NAME" x="-88.65" y="79.99" size="1.27" layer="95" font="vector" rot="R90" align="center"/>
<attribute name="VALUE" x="-84.06" y="79.99" size="1.27" layer="96" font="vector" rot="R90" align="center"/>
</instance>
<instance part="U$33" gate="G$1" x="-86.36" y="68.58" smashed="yes">
<attribute name="VALUE" x="-87.884" y="66.04" size="1.27" layer="96"/>
</instance>
<instance part="R8" gate="G$1" x="-96.52" y="81.28" smashed="yes">
<attribute name="NAME" x="-96.52" y="83.82" size="1.27" layer="95" font="vector" align="center"/>
<attribute name="VALUE" x="-96.52" y="81.28" size="1.016" layer="96" font="vector" ratio="15" align="center"/>
</instance>
<instance part="U$36" gate="G$1" x="-91.44" y="68.58" smashed="yes">
<attribute name="VALUE" x="-92.964" y="66.04" size="1.27" layer="96"/>
</instance>
<instance part="U$38" gate="G$1" x="-160.02" y="99.06" smashed="yes">
<attribute name="VALUE" x="-161.544" y="100.076" size="1.27" layer="96"/>
</instance>
<instance part="U$39" gate="G$1" x="-78.74" y="99.06" smashed="yes">
<attribute name="VALUE" x="-80.264" y="100.076" size="1.27" layer="96"/>
</instance>
<instance part="SJ1" gate="G$1" x="-96.52" y="86.36" smashed="yes">
<attribute name="NAME" x="-99.06" y="88.9" size="1.778" layer="95"/>
<attribute name="VALUE" x="-99.06" y="82.55" size="1.778" layer="96"/>
</instance>
<instance part="D3" gate="G$1" x="-60.96" y="88.9" smashed="yes" rot="R270">
<attribute name="NAME" x="-56.515" y="90.17" size="1.27" layer="95" rot="R270" align="center"/>
<attribute name="VALUE" x="-63.754" y="90.17" size="1.27" layer="96" rot="R270" align="center"/>
</instance>
<instance part="U$14" gate="G$1" x="-60.96" y="101.6" smashed="yes">
<attribute name="VALUE" x="-62.484" y="102.616" size="1.27" layer="96"/>
</instance>
<instance part="R10" gate="G$1" x="-60.96" y="81.28" smashed="yes" rot="R90">
<attribute name="NAME" x="-63.5" y="81.28" size="1.27" layer="95" font="vector" rot="R90" align="center"/>
<attribute name="VALUE" x="-60.96" y="81.28" size="1.016" layer="96" font="vector" ratio="15" rot="R90" align="center"/>
</instance>
<instance part="X3" gate="G$1" x="-27.94" y="129.54" smashed="yes">
<attribute name="NAME" x="-38.1" y="115.316" size="1.27" layer="95"/>
<attribute name="VALUE" x="-38.1" y="116.84" size="1.27" layer="96"/>
</instance>
<instance part="U$6" gate="G$1" x="-2.54" y="114.3" smashed="yes">
<attribute name="VALUE" x="-4.064" y="111.76" size="1.27" layer="96"/>
</instance>
<instance part="R12" gate="G$1" x="2.54" y="121.92" smashed="yes" rot="R90">
<attribute name="NAME" x="0" y="121.92" size="1.27" layer="95" font="vector" rot="R90" align="center"/>
<attribute name="VALUE" x="2.54" y="121.92" size="1.016" layer="96" font="vector" ratio="15" rot="R90" align="center"/>
</instance>
<instance part="R13" gate="G$1" x="7.62" y="121.92" smashed="yes" rot="R90">
<attribute name="NAME" x="5.08" y="121.92" size="1.27" layer="95" font="vector" rot="R90" align="center"/>
<attribute name="VALUE" x="7.62" y="121.92" size="1.016" layer="96" font="vector" ratio="15" rot="R90" align="center"/>
</instance>
<instance part="U$7" gate="G$1" x="2.54" y="111.76" smashed="yes">
<attribute name="VALUE" x="1.016" y="109.22" size="1.27" layer="96"/>
</instance>
<instance part="U$9" gate="G$1" x="7.62" y="111.76" smashed="yes">
<attribute name="VALUE" x="6.096" y="109.22" size="1.27" layer="96"/>
</instance>
<instance part="U1" gate="G$1" x="2.54" y="5.08" smashed="yes">
<attribute name="NAME" x="-12.7" y="40.64" size="1.27" layer="95"/>
<attribute name="VALUE" x="-12.7" y="-33.02" size="1.27" layer="96"/>
</instance>
<instance part="U$11" gate="G$1" x="30.48" y="30.48" smashed="yes">
<attribute name="VALUE" x="28.956" y="31.496" size="1.27" layer="96"/>
</instance>
<instance part="U$13" gate="G$1" x="35.56" y="5.08" smashed="yes" rot="R270">
<attribute name="VALUE" x="36.576" y="6.604" size="1.27" layer="96" rot="R270"/>
</instance>
<instance part="C1" gate="G$1" x="-53.34" y="20.32" smashed="yes">
<attribute name="NAME" x="-55.63" y="21.57" size="1.27" layer="95" font="vector" rot="R90" align="center"/>
<attribute name="VALUE" x="-51.04" y="21.57" size="1.27" layer="96" font="vector" rot="R90" align="center"/>
</instance>
<instance part="JP3" gate="A" x="68.58" y="10.16" smashed="yes">
<attribute name="NAME" x="62.23" y="20.955" size="1.778" layer="95"/>
<attribute name="VALUE" x="62.23" y="0" size="1.778" layer="96"/>
</instance>
<instance part="R14" gate="G$1" x="-48.26" y="15.24" smashed="yes" rot="R90">
<attribute name="NAME" x="-50.8" y="15.24" size="1.27" layer="95" font="vector" rot="R90" align="center"/>
<attribute name="VALUE" x="-48.26" y="15.24" size="1.016" layer="96" font="vector" ratio="15" rot="R90" align="center"/>
</instance>
<instance part="GND4" gate="1" x="-53.34" y="12.7" smashed="yes">
<attribute name="VALUE" x="-55.88" y="10.16" size="1.778" layer="96"/>
</instance>
<instance part="GND5" gate="1" x="40.64" y="7.62" smashed="yes">
<attribute name="VALUE" x="38.1" y="5.08" size="1.778" layer="96"/>
</instance>
<instance part="GND7" gate="1" x="40.64" y="-20.32" smashed="yes">
<attribute name="VALUE" x="38.1" y="-22.86" size="1.778" layer="96"/>
</instance>
<instance part="GND8" gate="1" x="-17.78" y="-20.32" smashed="yes">
<attribute name="VALUE" x="-20.32" y="-22.86" size="1.778" layer="96"/>
</instance>
<instance part="U$15" gate="G$1" x="-53.34" y="30.48" smashed="yes">
<attribute name="VALUE" x="-54.864" y="31.496" size="1.27" layer="96"/>
</instance>
<instance part="U$19" gate="G$1" x="-35.56" y="25.4" smashed="yes">
<attribute name="VALUE" x="-37.084" y="26.416" size="1.27" layer="96"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<pinref part="X2" gate="G$1" pin="GND"/>
<pinref part="GND3" gate="1" pin="GND"/>
<wire x1="5.08" y1="58.42" x2="5.08" y2="53.34" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R6" gate="G$1" pin="1"/>
<pinref part="GND2" gate="1" pin="GND"/>
<wire x1="63.5" y1="78.74" x2="63.5" y2="81.28" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="X2" gate="G$2" pin="TP"/>
<pinref part="GND1" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C7" gate="G$1" pin="2"/>
<pinref part="U$28" gate="G$1" pin="GND"/>
<wire x1="-10.16" y1="154.94" x2="-10.16" y2="152.4" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="GND"/>
<pinref part="U$12" gate="G$1" pin="GND"/>
<wire x1="12.7" y1="149.86" x2="10.16" y2="149.86" width="0.1524" layer="91"/>
<wire x1="10.16" y1="149.86" x2="10.16" y2="147.32" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="IC1" gate="G$2" pin="TP"/>
<pinref part="U$1" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="SW2" gate="G$1" pin="P"/>
<pinref part="SW2" gate="G$1" pin="P1"/>
<wire x1="-63.5" y1="127" x2="-60.96" y2="127" width="0.1524" layer="91"/>
<pinref part="GND6" gate="1" pin="GND"/>
<junction x="-60.96" y="127"/>
<wire x1="-60.96" y1="127" x2="-60.96" y2="124.46" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C6" gate="G$1" pin="2"/>
<pinref part="U$27" gate="G$1" pin="GND"/>
<wire x1="-147.32" y1="129.54" x2="-147.32" y2="127" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C8" gate="G$1" pin="2"/>
<pinref part="U$29" gate="G$1" pin="GND"/>
<wire x1="-114.3" y1="129.54" x2="-114.3" y2="127" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U2" gate="G$1" pin="GND"/>
<wire x1="-137.16" y1="139.7" x2="-137.16" y2="127" width="0.1524" layer="91"/>
<pinref part="U$30" gate="G$1" pin="GND"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="1"/>
<pinref part="U$22" gate="G$1" pin="GND"/>
<wire x1="-91.44" y1="127" x2="-91.44" y2="134.62" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C2" gate="G$1" pin="2"/>
<pinref part="U$17" gate="G$1" pin="GND"/>
<wire x1="-106.68" y1="129.54" x2="-106.68" y2="127" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C3" gate="G$1" pin="2"/>
<pinref part="U$33" gate="G$1" pin="GND"/>
<wire x1="-86.36" y1="76.2" x2="-86.36" y2="71.12" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R8" gate="G$1" pin="2"/>
<pinref part="U$36" gate="G$1" pin="GND"/>
<pinref part="U3" gate="G$1" pin="VSS"/>
<wire x1="-91.44" y1="81.28" x2="-91.44" y2="78.74" width="0.1524" layer="91"/>
<wire x1="-91.44" y1="78.74" x2="-91.44" y2="71.12" width="0.1524" layer="91"/>
<wire x1="-106.68" y1="81.28" x2="-104.14" y2="81.28" width="0.1524" layer="91"/>
<wire x1="-104.14" y1="81.28" x2="-104.14" y2="78.74" width="0.1524" layer="91"/>
<wire x1="-104.14" y1="78.74" x2="-91.44" y2="78.74" width="0.1524" layer="91"/>
<junction x="-91.44" y="78.74"/>
</segment>
<segment>
<wire x1="-2.54" y1="119.38" x2="-17.78" y2="119.38" width="0.1524" layer="91"/>
<pinref part="X3" gate="G$1" pin="GND"/>
<label x="-17.78" y="119.38" size="1.778" layer="95"/>
<pinref part="U$6" gate="G$1" pin="GND"/>
<wire x1="-2.54" y1="119.38" x2="-2.54" y2="116.84" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R12" gate="G$1" pin="1"/>
<pinref part="U$7" gate="G$1" pin="GND"/>
<wire x1="2.54" y1="116.84" x2="2.54" y2="114.3" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R13" gate="G$1" pin="1"/>
<pinref part="U$9" gate="G$1" pin="GND"/>
<wire x1="7.62" y1="114.3" x2="7.62" y2="116.84" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C1" gate="G$1" pin="2"/>
<wire x1="-53.34" y1="17.78" x2="-53.34" y2="15.24" width="0.1524" layer="91"/>
<pinref part="GND4" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="PGND1@2"/>
<wire x1="22.86" y1="10.16" x2="40.64" y2="10.16" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$1" pin="PGND1@1"/>
<wire x1="22.86" y1="12.7" x2="40.64" y2="12.7" width="0.1524" layer="91"/>
<junction x="40.64" y="10.16"/>
<wire x1="40.64" y1="12.7" x2="40.64" y2="10.16" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="3"/>
<wire x1="40.64" y1="12.7" x2="66.04" y2="12.7" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="4"/>
<wire x1="66.04" y1="10.16" x2="66.04" y2="12.7" width="0.1524" layer="91"/>
<junction x="66.04" y="12.7"/>
<pinref part="GND5" gate="1" pin="GND"/>
<junction x="40.64" y="12.7"/>
<label x="73.66" y="10.16" size="1.778" layer="95"/>
<label x="73.66" y="12.7" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="PGND2@2"/>
<wire x1="22.86" y1="-15.24" x2="40.64" y2="-15.24" width="0.1524" layer="91"/>
<wire x1="40.64" y1="-15.24" x2="40.64" y2="-17.78" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$1" pin="PGND2@1"/>
<wire x1="22.86" y1="-12.7" x2="40.64" y2="-12.7" width="0.1524" layer="91"/>
<wire x1="40.64" y1="-12.7" x2="40.64" y2="-15.24" width="0.1524" layer="91"/>
<junction x="40.64" y="-15.24"/>
<pinref part="GND7" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="GND@1"/>
<wire x1="-15.24" y1="-15.24" x2="-17.78" y2="-15.24" width="0.1524" layer="91"/>
<wire x1="-17.78" y1="-15.24" x2="-17.78" y2="-17.78" width="0.1524" layer="91"/>
<pinref part="GND8" gate="1" pin="GND"/>
</segment>
</net>
<net name="3.3V" class="0">
<segment>
<pinref part="X2" gate="G$1" pin="VCC"/>
<pinref part="U$2" gate="G$1" pin="3.3V"/>
</segment>
<segment>
<pinref part="R1" gate="G$1" pin="2"/>
<pinref part="U$4" gate="G$1" pin="3.3V"/>
<wire x1="55.88" y1="96.52" x2="55.88" y2="101.6" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R9" gate="G$1" pin="2"/>
<pinref part="U$8" gate="G$1" pin="3.3V"/>
<wire x1="48.26" y1="96.52" x2="48.26" y2="101.6" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R3" gate="G$1" pin="2"/>
<pinref part="U$5" gate="G$1" pin="3.3V"/>
</segment>
<segment>
<wire x1="-116.84" y1="144.78" x2="-114.3" y2="144.78" width="0.1524" layer="91"/>
<wire x1="-114.3" y1="144.78" x2="-106.68" y2="144.78" width="0.1524" layer="91"/>
<wire x1="-106.68" y1="144.78" x2="-106.68" y2="147.32" width="0.1524" layer="91"/>
<pinref part="C8" gate="G$1" pin="1"/>
<wire x1="-114.3" y1="137.16" x2="-114.3" y2="144.78" width="0.1524" layer="91"/>
<junction x="-114.3" y="144.78"/>
<pinref part="U2" gate="G$1" pin="OUT"/>
<pinref part="U$10" gate="G$1" pin="3.3V"/>
</segment>
<segment>
<pinref part="C2" gate="G$1" pin="1"/>
<pinref part="U$24" gate="G$1" pin="3.3V"/>
</segment>
<segment>
<pinref part="D3" gate="G$1" pin="A"/>
<wire x1="-60.96" y1="93.98" x2="-60.96" y2="99.06" width="0.1524" layer="91"/>
<pinref part="U$14" gate="G$1" pin="3.3V"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="VCC"/>
<wire x1="-15.24" y1="27.94" x2="-48.26" y2="27.94" width="0.1524" layer="91"/>
<pinref part="C1" gate="G$1" pin="1"/>
<wire x1="-48.26" y1="27.94" x2="-53.34" y2="27.94" width="0.1524" layer="91"/>
<wire x1="-53.34" y1="25.4" x2="-53.34" y2="27.94" width="0.1524" layer="91"/>
<pinref part="R14" gate="G$1" pin="2"/>
<wire x1="-48.26" y1="20.32" x2="-48.26" y2="27.94" width="0.1524" layer="91"/>
<junction x="-48.26" y="27.94"/>
<pinref part="U$15" gate="G$1" pin="3.3V"/>
<junction x="-53.34" y="27.94"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="PWMB"/>
<wire x1="-15.24" y1="-7.62" x2="-35.56" y2="-7.62" width="0.1524" layer="91"/>
<label x="-27.94" y="-7.62" size="1.778" layer="95"/>
<pinref part="U1" gate="G$1" pin="PWMA"/>
<wire x1="-15.24" y1="17.78" x2="-35.56" y2="17.78" width="0.1524" layer="91"/>
<label x="-27.94" y="17.78" size="1.778" layer="95"/>
<wire x1="-35.56" y1="17.78" x2="-35.56" y2="22.86" width="0.1524" layer="91"/>
<wire x1="-35.56" y1="-7.62" x2="-35.56" y2="17.78" width="0.1524" layer="91"/>
<junction x="-35.56" y="17.78"/>
<pinref part="U$19" gate="G$1" pin="3.3V"/>
</segment>
</net>
<net name="RESET" class="0">
<segment>
<pinref part="X2" gate="G$1" pin="RESET"/>
<wire x1="-30.48" y1="76.2" x2="-43.18" y2="76.2" width="0.1524" layer="91"/>
<label x="-40.64" y="76.2" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="81.28" y1="45.72" x2="68.58" y2="45.72" width="0.1524" layer="91"/>
<label x="71.12" y="45.72" size="1.778" layer="95"/>
<pinref part="Q1" gate="G$1" pin="C"/>
</segment>
<segment>
<pinref part="R3" gate="G$1" pin="1"/>
<wire x1="-60.96" y1="147.32" x2="-60.96" y2="137.16" width="0.1524" layer="91"/>
<label x="-58.42" y="139.7" size="1.778" layer="95" rot="R90"/>
<pinref part="SW2" gate="G$1" pin="S1"/>
<pinref part="SW2" gate="G$1" pin="S"/>
<wire x1="-60.96" y1="137.16" x2="-63.5" y2="137.16" width="0.1524" layer="91"/>
<junction x="-60.96" y="137.16"/>
</segment>
</net>
<net name="ADC" class="0">
<segment>
<pinref part="X2" gate="G$1" pin="ADC"/>
<wire x1="-30.48" y1="73.66" x2="-43.18" y2="73.66" width="0.1524" layer="91"/>
<label x="-40.64" y="73.66" size="1.778" layer="95"/>
</segment>
</net>
<net name="CH_PD" class="0">
<segment>
<pinref part="X2" gate="G$1" pin="CH_PD"/>
<wire x1="-43.18" y1="71.12" x2="-30.48" y2="71.12" width="0.1524" layer="91"/>
<label x="-40.64" y="71.12" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="R1" gate="G$1" pin="1"/>
<wire x1="55.88" y1="86.36" x2="55.88" y2="76.2" width="0.1524" layer="91"/>
<label x="55.88" y="76.2" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="GPIO16" class="0">
<segment>
<pinref part="X2" gate="G$1" pin="GPIO16"/>
<wire x1="-30.48" y1="68.58" x2="-43.18" y2="68.58" width="0.1524" layer="91"/>
<label x="-40.64" y="68.58" size="1.778" layer="95"/>
</segment>
</net>
<net name="GPIO15" class="0">
<segment>
<pinref part="X2" gate="G$1" pin="GPIO15"/>
<wire x1="5.08" y1="60.96" x2="20.32" y2="60.96" width="0.1524" layer="91"/>
<label x="10.16" y="60.96" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="R6" gate="G$1" pin="2"/>
<wire x1="63.5" y1="91.44" x2="63.5" y2="104.14" width="0.1524" layer="91"/>
<label x="63.5" y="93.98" size="1.778" layer="95" rot="R90"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="BIN2"/>
<wire x1="-15.24" y1="-5.08" x2="-30.48" y2="-5.08" width="0.1524" layer="91"/>
<label x="-30.48" y="-5.08" size="1.778" layer="95"/>
</segment>
</net>
<net name="GPIO0" class="0">
<segment>
<pinref part="X2" gate="G$1" pin="GPIO0"/>
<wire x1="5.08" y1="66.04" x2="20.32" y2="66.04" width="0.1524" layer="91"/>
<label x="10.16" y="66.04" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="68.58" y1="73.66" x2="81.28" y2="73.66" width="0.1524" layer="91"/>
<label x="71.12" y="73.66" size="1.778" layer="95"/>
<pinref part="Q2" gate="G$1" pin="C"/>
</segment>
<segment>
<pinref part="R10" gate="G$1" pin="1"/>
<wire x1="-60.96" y1="76.2" x2="-60.96" y2="66.04" width="0.1524" layer="91"/>
<label x="-60.96" y="66.04" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="RXD" class="0">
<segment>
<pinref part="X2" gate="G$1" pin="RXD"/>
<wire x1="22.86" y1="73.66" x2="5.08" y2="73.66" width="0.1524" layer="91"/>
<label x="10.16" y="73.66" size="1.778" layer="95"/>
<pinref part="R11" gate="G$1" pin="2"/>
</segment>
</net>
<net name="TXD" class="0">
<segment>
<pinref part="X2" gate="G$1" pin="TXD"/>
<wire x1="5.08" y1="76.2" x2="20.32" y2="76.2" width="0.1524" layer="91"/>
<label x="10.16" y="76.2" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="55.88" y1="127" x2="43.18" y2="127" width="0.1524" layer="91"/>
<pinref part="IC1" gate="G$1" pin="RXD"/>
<label x="45.72" y="127" size="1.778" layer="95"/>
</segment>
</net>
<net name="RTS" class="0">
<segment>
<wire x1="68.58" y1="55.88" x2="68.58" y2="58.42" width="0.1524" layer="91"/>
<wire x1="68.58" y1="58.42" x2="66.04" y2="60.96" width="0.1524" layer="91"/>
<wire x1="66.04" y1="60.96" x2="48.26" y2="60.96" width="0.1524" layer="91"/>
<wire x1="48.26" y1="60.96" x2="45.72" y2="63.5" width="0.1524" layer="91"/>
<wire x1="45.72" y1="63.5" x2="45.72" y2="68.58" width="0.1524" layer="91"/>
<pinref part="R5" gate="G$1" pin="1"/>
<wire x1="45.72" y1="68.58" x2="48.26" y2="68.58" width="0.1524" layer="91"/>
<wire x1="38.1" y1="68.58" x2="45.72" y2="68.58" width="0.1524" layer="91"/>
<junction x="45.72" y="68.58"/>
<label x="43.18" y="68.58" size="1.778" layer="95" rot="R180"/>
<pinref part="Q1" gate="G$1" pin="E"/>
</segment>
<segment>
<wire x1="55.88" y1="124.46" x2="43.18" y2="124.46" width="0.1524" layer="91"/>
<pinref part="IC1" gate="G$1" pin="RTS"/>
<label x="45.72" y="124.46" size="1.778" layer="95"/>
</segment>
</net>
<net name="DTR" class="0">
<segment>
<wire x1="68.58" y1="63.5" x2="68.58" y2="60.96" width="0.1524" layer="91"/>
<wire x1="68.58" y1="60.96" x2="66.04" y2="58.42" width="0.1524" layer="91"/>
<wire x1="66.04" y1="58.42" x2="48.26" y2="58.42" width="0.1524" layer="91"/>
<wire x1="48.26" y1="58.42" x2="45.72" y2="55.88" width="0.1524" layer="91"/>
<wire x1="45.72" y1="55.88" x2="45.72" y2="50.8" width="0.1524" layer="91"/>
<pinref part="R4" gate="G$1" pin="1"/>
<wire x1="45.72" y1="50.8" x2="48.26" y2="50.8" width="0.1524" layer="91"/>
<wire x1="45.72" y1="50.8" x2="38.1" y2="50.8" width="0.1524" layer="91"/>
<junction x="45.72" y="50.8"/>
<label x="43.18" y="50.8" size="1.778" layer="95" rot="R180"/>
<pinref part="Q2" gate="G$1" pin="E"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="DTR"/>
<wire x1="43.18" y1="134.62" x2="55.88" y2="134.62" width="0.1524" layer="91"/>
<label x="45.72" y="134.62" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="R4" gate="G$1" pin="2"/>
<wire x1="63.5" y1="50.8" x2="58.42" y2="50.8" width="0.1524" layer="91"/>
<pinref part="Q1" gate="G$1" pin="B"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<pinref part="R5" gate="G$1" pin="2"/>
<wire x1="58.42" y1="68.58" x2="63.5" y2="68.58" width="0.1524" layer="91"/>
<pinref part="Q2" gate="G$1" pin="B"/>
</segment>
</net>
<net name="GPIO5/SCL" class="0">
<segment>
<wire x1="20.32" y1="71.12" x2="5.08" y2="71.12" width="0.1524" layer="91"/>
<pinref part="X2" gate="G$1" pin="GPIO5"/>
<label x="10.16" y="71.12" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="AIN1"/>
<wire x1="-15.24" y1="22.86" x2="-30.48" y2="22.86" width="0.1524" layer="91"/>
<label x="-30.48" y="22.86" size="1.778" layer="95"/>
</segment>
</net>
<net name="GPIO4/SDA" class="0">
<segment>
<pinref part="X2" gate="G$1" pin="GPIO4"/>
<wire x1="5.08" y1="68.58" x2="20.32" y2="68.58" width="0.1524" layer="91"/>
<label x="10.16" y="68.58" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="AIN2"/>
<wire x1="-15.24" y1="20.32" x2="-30.48" y2="20.32" width="0.1524" layer="91"/>
<label x="-30.48" y="20.32" size="1.778" layer="95"/>
</segment>
</net>
<net name="GPIO2" class="0">
<segment>
<pinref part="X2" gate="G$1" pin="GPIO2"/>
<wire x1="20.32" y1="63.5" x2="5.08" y2="63.5" width="0.1524" layer="91"/>
<label x="10.16" y="63.5" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="R9" gate="G$1" pin="1"/>
<wire x1="48.26" y1="86.36" x2="48.26" y2="76.2" width="0.1524" layer="91"/>
<label x="48.26" y="76.2" size="1.778" layer="95" rot="R90"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="BIN1"/>
<wire x1="-15.24" y1="-2.54" x2="-30.48" y2="-2.54" width="0.1524" layer="91"/>
<label x="-30.48" y="-2.54" size="1.778" layer="95"/>
</segment>
</net>
<net name="GPIO14/SCK" class="0">
<segment>
<pinref part="X2" gate="G$1" pin="GPIO14"/>
<wire x1="-45.72" y1="66.04" x2="-30.48" y2="66.04" width="0.1524" layer="91"/>
<label x="-45.72" y="66.04" size="1.778" layer="95"/>
</segment>
</net>
<net name="GPIO13/MOSI" class="0">
<segment>
<pinref part="X2" gate="G$1" pin="GPIO13"/>
<wire x1="-45.72" y1="60.96" x2="-30.48" y2="60.96" width="0.1524" layer="91"/>
<label x="-45.72" y="60.96" size="1.778" layer="95"/>
</segment>
</net>
<net name="GPIO12/MISO" class="0">
<segment>
<pinref part="X2" gate="G$1" pin="GPIO12"/>
<wire x1="-30.48" y1="63.5" x2="-45.72" y2="63.5" width="0.1524" layer="91"/>
<label x="-45.72" y="63.5" size="1.778" layer="95"/>
</segment>
</net>
<net name="USB_RX" class="0">
<segment>
<pinref part="R11" gate="G$1" pin="1"/>
<wire x1="33.02" y1="73.66" x2="33.02" y2="86.36" width="0.1524" layer="91"/>
<label x="33.02" y="76.2" size="1.778" layer="95" rot="R90"/>
</segment>
<segment>
<wire x1="43.18" y1="129.54" x2="55.88" y2="129.54" width="0.1524" layer="91"/>
<pinref part="IC1" gate="G$1" pin="TXD"/>
<label x="45.72" y="129.54" size="1.778" layer="95"/>
</segment>
</net>
<net name="VBUS" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="VBUS"/>
<wire x1="-2.54" y1="139.7" x2="7.62" y2="139.7" width="0.1524" layer="91"/>
<pinref part="U$18" gate="G$1" pin="VBUS"/>
<wire x1="7.62" y1="139.7" x2="12.7" y2="139.7" width="0.1524" layer="91"/>
<wire x1="-2.54" y1="139.7" x2="-2.54" y2="142.24" width="0.1524" layer="91"/>
<pinref part="IC1" gate="G$1" pin="REGIN"/>
<wire x1="12.7" y1="160.02" x2="7.62" y2="160.02" width="0.1524" layer="91"/>
<wire x1="7.62" y1="160.02" x2="7.62" y2="139.7" width="0.1524" layer="91"/>
<junction x="7.62" y="139.7"/>
<pinref part="X3" gate="G$1" pin="VBUS"/>
<label x="-17.78" y="139.7" size="1.778" layer="95"/>
<wire x1="-2.54" y1="139.7" x2="-17.78" y2="139.7" width="0.1524" layer="91"/>
<junction x="-2.54" y="139.7"/>
</segment>
<segment>
<wire x1="-154.94" y1="157.48" x2="-154.94" y2="144.78" width="0.1524" layer="91"/>
<pinref part="U$3" gate="G$1" pin="VBUS"/>
<junction x="-147.32" y="144.78"/>
<pinref part="C6" gate="G$1" pin="1"/>
<wire x1="-137.16" y1="144.78" x2="-142.24" y2="144.78" width="0.1524" layer="91"/>
<wire x1="-142.24" y1="144.78" x2="-147.32" y2="144.78" width="0.1524" layer="91"/>
<wire x1="-147.32" y1="144.78" x2="-147.32" y2="137.16" width="0.1524" layer="91"/>
<wire x1="-147.32" y1="149.86" x2="-147.32" y2="144.78" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="IN"/>
<pinref part="D4" gate="G$1" pin="C"/>
<wire x1="-154.94" y1="144.78" x2="-147.32" y2="144.78" width="0.1524" layer="91"/>
<pinref part="R7" gate="G$1" pin="2"/>
<junction x="-142.24" y="144.78"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="VDD"/>
<wire x1="-160.02" y1="96.52" x2="-160.02" y2="86.36" width="0.1524" layer="91"/>
<wire x1="-160.02" y1="86.36" x2="-132.08" y2="86.36" width="0.1524" layer="91"/>
<pinref part="CHG" gate="G$1" pin="A"/>
<wire x1="-157.48" y1="81.28" x2="-160.02" y2="81.28" width="0.1524" layer="91"/>
<wire x1="-160.02" y1="81.28" x2="-160.02" y2="86.36" width="0.1524" layer="91"/>
<junction x="-160.02" y="86.36"/>
<pinref part="U$38" gate="G$1" pin="VBUS"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="VDD"/>
<wire x1="12.7" y1="162.56" x2="10.16" y2="162.56" width="0.1524" layer="91"/>
<pinref part="IC1" gate="G$1" pin="VIO"/>
<wire x1="12.7" y1="165.1" x2="10.16" y2="165.1" width="0.1524" layer="91"/>
<wire x1="10.16" y1="165.1" x2="10.16" y2="162.56" width="0.1524" layer="91"/>
<junction x="10.16" y="162.56"/>
<pinref part="C7" gate="G$1" pin="1"/>
<wire x1="10.16" y1="162.56" x2="-10.16" y2="162.56" width="0.1524" layer="91"/>
</segment>
</net>
<net name="VBAT" class="0">
<segment>
<pinref part="U$21" gate="G$1" pin="VBAT"/>
<pinref part="D4" gate="G$1" pin="A"/>
<wire x1="-147.32" y1="154.94" x2="-147.32" y2="157.48" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="2"/>
<pinref part="U$16" gate="G$1" pin="VBAT"/>
<wire x1="-91.44" y1="144.78" x2="-91.44" y2="137.16" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C3" gate="G$1" pin="1"/>
<wire x1="-86.36" y1="86.36" x2="-91.44" y2="86.36" width="0.1524" layer="91"/>
<wire x1="-86.36" y1="83.82" x2="-86.36" y2="86.36" width="0.1524" layer="91"/>
<wire x1="-86.36" y1="86.36" x2="-78.74" y2="86.36" width="0.1524" layer="91"/>
<junction x="-86.36" y="86.36"/>
<pinref part="U$39" gate="G$1" pin="VBAT"/>
<wire x1="-78.74" y1="96.52" x2="-78.74" y2="86.36" width="0.1524" layer="91"/>
<pinref part="SJ1" gate="G$1" pin="2"/>
</segment>
</net>
<net name="EN" class="0">
<segment>
<pinref part="R7" gate="G$1" pin="1"/>
<wire x1="-142.24" y1="134.62" x2="-139.7" y2="134.62" width="0.1524" layer="91"/>
<wire x1="-139.7" y1="134.62" x2="-139.7" y2="142.24" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="EN"/>
<wire x1="-139.7" y1="142.24" x2="-137.16" y2="142.24" width="0.1524" layer="91"/>
<label x="-142.24" y="132.08" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="CHG" gate="G$1" pin="C"/>
<pinref part="R2" gate="G$1" pin="1"/>
<wire x1="-149.86" y1="81.28" x2="-147.32" y2="81.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="R2" gate="G$1" pin="2"/>
<pinref part="U3" gate="G$1" pin="STAT"/>
<wire x1="-137.16" y1="81.28" x2="-132.08" y2="81.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="PROG"/>
<pinref part="R8" gate="G$1" pin="1"/>
<wire x1="-106.68" y1="83.82" x2="-104.14" y2="83.82" width="0.1524" layer="91"/>
<wire x1="-104.14" y1="83.82" x2="-101.6" y2="83.82" width="0.1524" layer="91"/>
<wire x1="-101.6" y1="83.82" x2="-101.6" y2="81.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="VBAT"/>
<pinref part="SJ1" gate="G$1" pin="1"/>
<wire x1="-101.6" y1="86.36" x2="-106.68" y2="86.36" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="D3" gate="G$1" pin="C"/>
<pinref part="R10" gate="G$1" pin="2"/>
</segment>
</net>
<net name="CC1" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="CC1"/>
<label x="-17.78" y="132.08" size="1.778" layer="95"/>
<pinref part="R13" gate="G$1" pin="2"/>
<wire x1="7.62" y1="132.08" x2="7.62" y2="127" width="0.1524" layer="91"/>
<wire x1="-17.78" y1="132.08" x2="7.62" y2="132.08" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CC2" class="0">
<segment>
<pinref part="X3" gate="G$1" pin="CC2"/>
<label x="-17.78" y="129.54" size="1.778" layer="95"/>
<pinref part="R12" gate="G$1" pin="2"/>
<wire x1="2.54" y1="129.54" x2="2.54" y2="127" width="0.1524" layer="91"/>
<wire x1="-17.78" y1="129.54" x2="2.54" y2="129.54" width="0.1524" layer="91"/>
</segment>
</net>
<net name="D+" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="D+"/>
<wire x1="12.7" y1="137.16" x2="-2.54" y2="137.16" width="0.1524" layer="91"/>
<pinref part="X3" gate="G$1" pin="D+"/>
<wire x1="-17.78" y1="137.16" x2="-2.54" y2="137.16" width="0.1524" layer="91"/>
<label x="-17.78" y="137.16" size="1.778" layer="95"/>
</segment>
</net>
<net name="D-" class="0">
<segment>
<pinref part="IC1" gate="G$1" pin="D-"/>
<wire x1="12.7" y1="134.62" x2="-2.54" y2="134.62" width="0.1524" layer="91"/>
<pinref part="X3" gate="G$1" pin="D-"/>
<wire x1="-17.78" y1="134.62" x2="-2.54" y2="134.62" width="0.1524" layer="91"/>
<label x="-17.78" y="134.62" size="1.778" layer="95"/>
</segment>
</net>
<net name="VMOTOR" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="VM@1"/>
<pinref part="U$11" gate="G$1" pin="VMOTOR"/>
<wire x1="22.86" y1="27.94" x2="30.48" y2="27.94" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="VM@2"/>
<pinref part="U$13" gate="G$1" pin="VMOTOR"/>
<wire x1="22.86" y1="5.08" x2="33.02" y2="5.08" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$1" pin="VM@3"/>
<wire x1="22.86" y1="2.54" x2="33.02" y2="2.54" width="0.1524" layer="91"/>
<wire x1="33.02" y1="2.54" x2="33.02" y2="5.08" width="0.1524" layer="91"/>
<junction x="33.02" y="5.08"/>
</segment>
</net>
<net name="STBY" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="STBY"/>
<wire x1="-15.24" y1="7.62" x2="-48.26" y2="7.62" width="0.1524" layer="91"/>
<label x="-27.94" y="7.62" size="1.778" layer="95"/>
<pinref part="R14" gate="G$1" pin="1"/>
<wire x1="-48.26" y1="10.16" x2="-48.26" y2="7.62" width="0.1524" layer="91"/>
</segment>
</net>
<net name="MA1" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="AOUT1@1"/>
<wire x1="22.86" y1="22.86" x2="25.4" y2="22.86" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$1" pin="AOUT1@2"/>
<wire x1="22.86" y1="20.32" x2="25.4" y2="20.32" width="0.1524" layer="91"/>
<wire x1="25.4" y1="20.32" x2="25.4" y2="22.86" width="0.1524" layer="91"/>
<wire x1="25.4" y1="22.86" x2="43.18" y2="22.86" width="0.1524" layer="91"/>
<junction x="25.4" y="22.86"/>
<wire x1="43.18" y1="22.86" x2="48.26" y2="17.78" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="1"/>
<wire x1="48.26" y1="17.78" x2="66.04" y2="17.78" width="0.1524" layer="91"/>
<label x="73.66" y="17.78" size="1.778" layer="95"/>
</segment>
</net>
<net name="MA2" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="AOUT2@1"/>
<wire x1="22.86" y1="17.78" x2="25.4" y2="17.78" width="0.1524" layer="91"/>
<wire x1="25.4" y1="17.78" x2="45.72" y2="17.78" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$1" pin="AOUT2@2"/>
<wire x1="22.86" y1="15.24" x2="25.4" y2="15.24" width="0.1524" layer="91"/>
<wire x1="25.4" y1="15.24" x2="25.4" y2="17.78" width="0.1524" layer="91"/>
<junction x="25.4" y="17.78"/>
<wire x1="45.72" y1="17.78" x2="48.26" y2="15.24" width="0.1524" layer="91"/>
<pinref part="JP3" gate="A" pin="2"/>
<wire x1="48.26" y1="15.24" x2="66.04" y2="15.24" width="0.1524" layer="91"/>
<label x="73.66" y="15.24" size="1.778" layer="95"/>
</segment>
</net>
<net name="MB1" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="BOUT1@1"/>
<wire x1="22.86" y1="-2.54" x2="27.94" y2="-2.54" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$1" pin="BOUT1@2"/>
<wire x1="22.86" y1="-5.08" x2="27.94" y2="-5.08" width="0.1524" layer="91"/>
<wire x1="27.94" y1="-5.08" x2="27.94" y2="-2.54" width="0.1524" layer="91"/>
<junction x="27.94" y="-2.54"/>
<pinref part="JP3" gate="A" pin="6"/>
<wire x1="27.94" y1="-2.54" x2="43.18" y2="-2.54" width="0.1524" layer="91"/>
<wire x1="43.18" y1="-2.54" x2="50.8" y2="5.08" width="0.1524" layer="91"/>
<wire x1="50.8" y1="5.08" x2="66.04" y2="5.08" width="0.1524" layer="91"/>
<label x="73.66" y="5.08" size="1.778" layer="95"/>
</segment>
</net>
<net name="MB2" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="BOUT2@1"/>
<wire x1="22.86" y1="-7.62" x2="27.94" y2="-7.62" width="0.1524" layer="91"/>
<wire x1="27.94" y1="-7.62" x2="35.56" y2="-7.62" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$1" pin="BOUT2@2"/>
<wire x1="22.86" y1="-10.16" x2="27.94" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="27.94" y1="-10.16" x2="27.94" y2="-7.62" width="0.1524" layer="91"/>
<junction x="27.94" y="-7.62"/>
<pinref part="JP3" gate="A" pin="5"/>
<wire x1="50.8" y1="7.62" x2="66.04" y2="7.62" width="0.1524" layer="91"/>
<wire x1="35.56" y1="-7.62" x2="50.8" y2="7.62" width="0.1524" layer="91"/>
<label x="73.66" y="7.62" size="1.778" layer="95"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="6.3" minversion="6.2.2" severity="warning">
Since Version 6.2.2 text objects can contain more than one line,
which will not be processed correctly with this version.
</note>
</compatibility>
</eagle>
