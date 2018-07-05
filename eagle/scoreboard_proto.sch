<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.0.1">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.01" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="4" name="Route4" color="1" fill="4" visible="no" active="no"/>
<layer number="5" name="Route5" color="4" fill="4" visible="no" active="no"/>
<layer number="6" name="Route6" color="1" fill="8" visible="no" active="no"/>
<layer number="7" name="Route7" color="4" fill="8" visible="no" active="no"/>
<layer number="8" name="Route8" color="1" fill="2" visible="no" active="no"/>
<layer number="9" name="Route9" color="4" fill="2" visible="no" active="no"/>
<layer number="10" name="Route10" color="1" fill="7" visible="no" active="no"/>
<layer number="11" name="Route11" color="4" fill="7" visible="no" active="no"/>
<layer number="12" name="Route12" color="1" fill="5" visible="no" active="no"/>
<layer number="13" name="Route13" color="4" fill="5" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="24" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
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
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="no" active="yes"/>
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
<layer number="99" name="SpiceOrder" color="5" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="ScoreBoard">
<packages>
<package name="HT16K33">
<wire x1="0" y1="0" x2="20.32" y2="0" width="0.127" layer="21"/>
<wire x1="20.32" y1="0" x2="20.32" y2="35.56" width="0.127" layer="21"/>
<wire x1="20.32" y1="35.56" x2="0" y2="35.56" width="0.127" layer="21"/>
<wire x1="0" y1="35.56" x2="0" y2="0" width="0.127" layer="21"/>
<pad name="GND" x="1.27" y="34.29" drill="1.016" diameter="1.778"/>
<pad name="C0" x="1.27" y="31.75" drill="1.016" diameter="1.778"/>
<pad name="C1" x="1.27" y="29.21" drill="1.016" diameter="1.778"/>
<pad name="C2" x="1.27" y="26.67" drill="1.016" diameter="1.778"/>
<pad name="C3" x="1.27" y="24.13" drill="1.016" diameter="1.778"/>
<pad name="C4" x="1.27" y="21.59" drill="1.016" diameter="1.778"/>
<pad name="C5" x="1.27" y="19.05" drill="1.016" diameter="1.778"/>
<pad name="C6" x="1.27" y="16.51" drill="1.016" diameter="1.778"/>
<pad name="C7" x="1.27" y="13.97" drill="1.016" diameter="1.778"/>
<pad name="A15" x="1.27" y="11.43" drill="1.016" diameter="1.778"/>
<pad name="A14" x="1.27" y="8.89" drill="1.016" diameter="1.778"/>
<pad name="A13" x="1.27" y="6.35" drill="1.016" diameter="1.778"/>
<pad name="A12" x="1.27" y="3.81" drill="1.016" diameter="1.778"/>
<pad name="A11" x="1.27" y="1.27" drill="1.016" diameter="1.778"/>
<pad name="A10" x="19.05" y="1.27" drill="1.016" diameter="1.778"/>
<pad name="A9" x="19.05" y="3.81" drill="1.016" diameter="1.778"/>
<pad name="A8" x="19.05" y="6.35" drill="1.016" diameter="1.778"/>
<pad name="A7" x="19.05" y="8.89" drill="1.016" diameter="1.778"/>
<pad name="A6" x="19.05" y="11.43" drill="1.016" diameter="1.778"/>
<pad name="A5" x="19.05" y="13.97" drill="1.016" diameter="1.778"/>
<pad name="A4" x="19.05" y="16.51" drill="1.016" diameter="1.778"/>
<pad name="A3" x="19.05" y="19.05" drill="1.016" diameter="1.778"/>
<pad name="A2" x="19.05" y="21.59" drill="1.016" diameter="1.778"/>
<pad name="A1" x="19.05" y="24.13" drill="1.016" diameter="1.778"/>
<pad name="A0" x="19.05" y="26.67" drill="1.016" diameter="1.778"/>
<pad name="SCL" x="19.05" y="29.21" drill="1.016" diameter="1.778"/>
<pad name="SDA" x="19.05" y="31.75" drill="1.016" diameter="1.778"/>
<pad name="VDD" x="19.05" y="34.29" drill="1.016" diameter="1.778"/>
<text x="0" y="36.83" size="1.27" layer="25">&gt;NAME</text>
<text x="0" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="ESP8266">
<pad name="A0" x="1.27" y="-1.27" drill="1.016" diameter="1.778"/>
<pad name="RSV@1" x="1.27" y="-3.81" drill="1.016" diameter="1.778"/>
<pad name="RSV@2" x="1.27" y="-6.35" drill="1.016" diameter="1.778"/>
<pad name="SD3" x="1.27" y="-8.89" drill="1.016" diameter="1.778"/>
<pad name="SD2" x="1.27" y="-11.43" drill="1.016" diameter="1.778"/>
<pad name="SD1" x="1.27" y="-13.97" drill="1.016" diameter="1.778"/>
<pad name="CMD" x="1.27" y="-16.51" drill="1.016" diameter="1.778"/>
<pad name="SD0" x="1.27" y="-19.05" drill="1.016" diameter="1.778"/>
<pad name="CLK" x="1.27" y="-21.59" drill="1.016" diameter="1.778"/>
<pad name="GND@1" x="1.27" y="-24.13" drill="1.016" diameter="1.778"/>
<pad name="3V3@1" x="1.27" y="-26.67" drill="1.016" diameter="1.778"/>
<pad name="EN" x="1.27" y="-29.21" drill="1.016" diameter="1.778"/>
<pad name="RST" x="1.27" y="-31.75" drill="1.016" diameter="1.778"/>
<pad name="GND@2" x="1.27" y="-34.29" drill="1.016" diameter="1.778"/>
<pad name="VIN" x="1.27" y="-36.83" drill="1.016" diameter="1.778"/>
<pad name="3V3@2" x="24.13" y="-36.83" drill="1.016" diameter="1.778"/>
<pad name="GND@3" x="24.13" y="-34.29" drill="1.016" diameter="1.778"/>
<pad name="D10" x="24.13" y="-31.75" drill="1.016" diameter="1.778"/>
<pad name="D9" x="24.13" y="-29.21" drill="1.016" diameter="1.778"/>
<pad name="D8" x="24.13" y="-26.67" drill="1.016" diameter="1.778"/>
<pad name="D7" x="24.13" y="-24.13" drill="1.016" diameter="1.778"/>
<pad name="D6" x="24.13" y="-21.59" drill="1.016" diameter="1.778"/>
<pad name="D5" x="24.13" y="-19.05" drill="1.016" diameter="1.778"/>
<pad name="GND@4" x="24.13" y="-16.51" drill="1.016" diameter="1.778"/>
<pad name="3V3@3" x="24.13" y="-13.97" drill="1.016" diameter="1.778"/>
<pad name="D4" x="24.13" y="-11.43" drill="1.016" diameter="1.778"/>
<pad name="D3" x="24.13" y="-8.89" drill="1.016" diameter="1.778"/>
<pad name="D2" x="24.13" y="-6.35" drill="1.016" diameter="1.778"/>
<pad name="D1" x="24.13" y="-3.81" drill="1.016" diameter="1.778"/>
<pad name="D0" x="24.13" y="-1.27" drill="1.016" diameter="1.778"/>
<wire x1="0" y1="5.08" x2="25.4" y2="5.08" width="0.127" layer="21"/>
<wire x1="25.4" y1="5.08" x2="25.4" y2="-43.18" width="0.127" layer="21"/>
<wire x1="25.4" y1="-43.18" x2="0" y2="-43.18" width="0.127" layer="21"/>
<wire x1="0" y1="-43.18" x2="0" y2="5.08" width="0.127" layer="21"/>
<text x="0" y="6.35" size="1.27" layer="25">&gt;NAME</text>
<text x="0" y="-46.99" size="1.27" layer="27">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="HT16K33">
<description>LED Dot Matrix Drive Control Module Digital Tube Driver</description>
<pin name="GND" x="0" y="0" length="middle"/>
<pin name="C0" x="0" y="-5.08" length="middle"/>
<pin name="C1" x="0" y="-10.16" length="middle"/>
<pin name="C2" x="0" y="-15.24" length="middle"/>
<pin name="C3" x="0" y="-20.32" length="middle"/>
<pin name="C4" x="0" y="-25.4" length="middle"/>
<pin name="C5" x="0" y="-30.48" length="middle"/>
<pin name="C6" x="0" y="-35.56" length="middle"/>
<pin name="C7" x="0" y="-40.64" length="middle"/>
<pin name="A15" x="0" y="-45.72" length="middle"/>
<pin name="A14" x="0" y="-50.8" length="middle"/>
<pin name="A13" x="0" y="-55.88" length="middle"/>
<pin name="A12" x="0" y="-60.96" length="middle"/>
<pin name="A11" x="0" y="-66.04" length="middle"/>
<pin name="VDD" x="38.1" y="0" length="middle" rot="R180"/>
<pin name="SDA" x="38.1" y="-5.08" length="middle" rot="R180"/>
<pin name="SCL" x="38.1" y="-10.16" length="middle" rot="R180"/>
<pin name="A0" x="38.1" y="-15.24" length="middle" rot="R180"/>
<pin name="A1" x="38.1" y="-20.32" length="middle" rot="R180"/>
<pin name="A2" x="38.1" y="-25.4" length="middle" rot="R180"/>
<pin name="A3" x="38.1" y="-30.48" length="middle" rot="R180"/>
<pin name="A4" x="38.1" y="-35.56" length="middle" rot="R180"/>
<pin name="A5" x="38.1" y="-40.64" length="middle" rot="R180"/>
<pin name="A6" x="38.1" y="-45.72" length="middle" rot="R180"/>
<pin name="A7" x="38.1" y="-50.8" length="middle" rot="R180"/>
<pin name="A8" x="38.1" y="-55.88" length="middle" rot="R180"/>
<pin name="A9" x="38.1" y="-60.96" length="middle" rot="R180"/>
<pin name="A10" x="38.1" y="-66.04" length="middle" rot="R180"/>
<wire x1="5.08" y1="5.08" x2="33.02" y2="5.08" width="0.254" layer="94"/>
<wire x1="33.02" y1="5.08" x2="33.02" y2="-71.12" width="0.254" layer="94"/>
<wire x1="33.02" y1="-71.12" x2="5.08" y2="-71.12" width="0.254" layer="94"/>
<wire x1="5.08" y1="-71.12" x2="5.08" y2="5.08" width="0.254" layer="94"/>
<text x="5.08" y="7.62" size="1.778" layer="95">&gt;NAME</text>
<text x="5.08" y="-76.2" size="1.778" layer="96">&gt;VALUE</text>
</symbol>
<symbol name="ESP8266">
<pin name="A0" x="0" y="0" length="middle"/>
<pin name="RSV@1" x="0" y="-5.08" length="middle"/>
<pin name="RSV@2" x="0" y="-10.16" length="middle"/>
<pin name="SD3" x="0" y="-15.24" length="middle"/>
<pin name="SD2" x="0" y="-20.32" length="middle"/>
<pin name="SD1" x="0" y="-25.4" length="middle"/>
<pin name="CMD" x="0" y="-30.48" length="middle"/>
<pin name="SD0" x="0" y="-35.56" length="middle"/>
<pin name="CLK" x="0" y="-40.64" length="middle"/>
<pin name="GND@1" x="0" y="-45.72" length="middle"/>
<pin name="3V3@1" x="0" y="-50.8" length="middle"/>
<pin name="EN" x="0" y="-55.88" length="middle"/>
<pin name="RST" x="0" y="-60.96" length="middle"/>
<pin name="GND@2" x="0" y="-66.04" length="middle"/>
<pin name="VIN" x="0" y="-71.12" length="middle"/>
<pin name="3V3@2" x="38.1" y="-71.12" length="middle" rot="R180"/>
<wire x1="5.08" y1="5.08" x2="33.02" y2="5.08" width="0.254" layer="94"/>
<wire x1="33.02" y1="5.08" x2="33.02" y2="-76.2" width="0.254" layer="94"/>
<wire x1="33.02" y1="-76.2" x2="5.08" y2="-76.2" width="0.254" layer="94"/>
<wire x1="5.08" y1="-76.2" x2="5.08" y2="5.08" width="0.254" layer="94"/>
<pin name="GND@3" x="38.1" y="-66.04" length="middle" rot="R180"/>
<pin name="D10" x="38.1" y="-60.96" length="middle" rot="R180"/>
<pin name="D9" x="38.1" y="-55.88" length="middle" rot="R180"/>
<pin name="D8" x="38.1" y="-50.8" length="middle" rot="R180"/>
<pin name="D7" x="38.1" y="-45.72" length="middle" rot="R180"/>
<pin name="D6" x="38.1" y="-40.64" length="middle" rot="R180"/>
<pin name="D5" x="38.1" y="-35.56" length="middle" rot="R180"/>
<pin name="GND@4" x="38.1" y="-30.48" length="middle" rot="R180"/>
<pin name="3V3@3" x="38.1" y="-25.4" length="middle" rot="R180"/>
<pin name="D4" x="38.1" y="-20.32" length="middle" rot="R180"/>
<pin name="D3" x="38.1" y="-15.24" length="middle" rot="R180"/>
<pin name="D2" x="38.1" y="-10.16" length="middle" rot="R180"/>
<pin name="D1" x="38.1" y="-5.08" length="middle" rot="R180"/>
<pin name="D0" x="38.1" y="0" length="middle" rot="R180"/>
<text x="5.08" y="7.62" size="1.778" layer="95">&gt;NAME</text>
<text x="5.08" y="-81.28" size="1.778" layer="97">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="HT16K33" prefix="HT">
<gates>
<gate name="G$1" symbol="HT16K33" x="76.2" y="-10.16"/>
</gates>
<devices>
<device name="" package="HT16K33">
<connects>
<connect gate="G$1" pin="A0" pad="A0"/>
<connect gate="G$1" pin="A1" pad="A1"/>
<connect gate="G$1" pin="A10" pad="A10"/>
<connect gate="G$1" pin="A11" pad="A11"/>
<connect gate="G$1" pin="A12" pad="A12"/>
<connect gate="G$1" pin="A13" pad="A13"/>
<connect gate="G$1" pin="A14" pad="A14"/>
<connect gate="G$1" pin="A15" pad="A15"/>
<connect gate="G$1" pin="A2" pad="A2"/>
<connect gate="G$1" pin="A3" pad="A3"/>
<connect gate="G$1" pin="A4" pad="A4"/>
<connect gate="G$1" pin="A5" pad="A5"/>
<connect gate="G$1" pin="A6" pad="A6"/>
<connect gate="G$1" pin="A7" pad="A7"/>
<connect gate="G$1" pin="A8" pad="A8"/>
<connect gate="G$1" pin="A9" pad="A9"/>
<connect gate="G$1" pin="C0" pad="C0"/>
<connect gate="G$1" pin="C1" pad="C1"/>
<connect gate="G$1" pin="C2" pad="C2"/>
<connect gate="G$1" pin="C3" pad="C3"/>
<connect gate="G$1" pin="C4" pad="C4"/>
<connect gate="G$1" pin="C5" pad="C5"/>
<connect gate="G$1" pin="C6" pad="C6"/>
<connect gate="G$1" pin="C7" pad="C7"/>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="SCL" pad="SCL"/>
<connect gate="G$1" pin="SDA" pad="SDA"/>
<connect gate="G$1" pin="VDD" pad="VDD"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="NODEMCU_V2" prefix="U">
<gates>
<gate name="G$1" symbol="ESP8266" x="0" y="0"/>
</gates>
<devices>
<device name="" package="ESP8266">
<connects>
<connect gate="G$1" pin="3V3@1" pad="3V3@1"/>
<connect gate="G$1" pin="3V3@2" pad="3V3@2"/>
<connect gate="G$1" pin="3V3@3" pad="3V3@3"/>
<connect gate="G$1" pin="A0" pad="A0"/>
<connect gate="G$1" pin="CLK" pad="CLK"/>
<connect gate="G$1" pin="CMD" pad="CMD"/>
<connect gate="G$1" pin="D0" pad="D0"/>
<connect gate="G$1" pin="D1" pad="D1"/>
<connect gate="G$1" pin="D10" pad="D10"/>
<connect gate="G$1" pin="D2" pad="D2"/>
<connect gate="G$1" pin="D3" pad="D3"/>
<connect gate="G$1" pin="D4" pad="D4"/>
<connect gate="G$1" pin="D5" pad="D5"/>
<connect gate="G$1" pin="D6" pad="D6"/>
<connect gate="G$1" pin="D7" pad="D7"/>
<connect gate="G$1" pin="D8" pad="D8"/>
<connect gate="G$1" pin="D9" pad="D9"/>
<connect gate="G$1" pin="EN" pad="EN"/>
<connect gate="G$1" pin="GND@1" pad="GND@1"/>
<connect gate="G$1" pin="GND@2" pad="GND@2"/>
<connect gate="G$1" pin="GND@3" pad="GND@3"/>
<connect gate="G$1" pin="GND@4" pad="GND@4"/>
<connect gate="G$1" pin="RST" pad="RST"/>
<connect gate="G$1" pin="RSV@1" pad="RSV@1"/>
<connect gate="G$1" pin="RSV@2" pad="RSV@2"/>
<connect gate="G$1" pin="SD0" pad="SD0"/>
<connect gate="G$1" pin="SD1" pad="SD1"/>
<connect gate="G$1" pin="SD2" pad="SD2"/>
<connect gate="G$1" pin="SD3" pad="SD3"/>
<connect gate="G$1" pin="VIN" pad="VIN"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply1" urn="urn:adsk.eagle:library:371">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
 GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
 Please keep in mind, that these devices are necessary for the
 automatic wiring of the supply signals.&lt;p&gt;
 The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
 In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
 &lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="+5V" urn="urn:adsk.eagle:symbol:26929/1" library_version="1">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="+5V" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="GND" urn="urn:adsk.eagle:symbol:26925/1" library_version="1">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="+5V" urn="urn:adsk.eagle:component:26963/1" prefix="P+" library_version="1">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="+5V" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="GND" urn="urn:adsk.eagle:component:26954/1" prefix="GND" library_version="1">
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
<library name="ScoreBoard" urn="urn:adsk.eagle:library:1662644">
<packages>
<package name="TCD00A3-A" urn="urn:adsk.eagle:footprint:1662654/1" library_version="1" library_locally_modified="yes">
<pad name="P$1" x="8.89" y="3.175" drill="0.762" diameter="1.778"/>
<pad name="P$2" x="11.43" y="3.175" drill="0.762" diameter="1.778"/>
<pad name="P$3" x="13.97" y="3.175" drill="0.762" diameter="1.778"/>
<pad name="P$4" x="16.51" y="3.175" drill="0.762" diameter="1.778"/>
<pad name="P$5" x="19.05" y="3.175" drill="0.762" diameter="1.778"/>
<pad name="P$6" x="21.59" y="3.175" drill="0.762" diameter="1.778"/>
<pad name="P$7" x="24.13" y="3.175" drill="0.762" diameter="1.778"/>
<pad name="P$8" x="26.67" y="3.175" drill="0.762" diameter="1.778"/>
<pad name="P$9" x="29.21" y="3.175" drill="0.762" diameter="1.778"/>
<pad name="P$10" x="29.21" y="18.415" drill="0.762" diameter="1.778"/>
<pad name="P$11" x="26.67" y="18.415" drill="0.762" diameter="1.778"/>
<pad name="P$12" x="24.13" y="18.415" drill="0.762" diameter="1.778"/>
<pad name="P$13" x="21.59" y="18.415" drill="0.762" diameter="1.778"/>
<pad name="P$14" x="19.05" y="18.415" drill="0.762" diameter="1.778"/>
<pad name="P$15" x="16.51" y="18.415" drill="0.762" diameter="1.778"/>
<pad name="P$16" x="13.97" y="18.415" drill="0.762" diameter="1.778"/>
<pad name="P$17" x="11.43" y="18.415" drill="0.762" diameter="1.778"/>
<pad name="P$18" x="8.89" y="18.415" drill="0.762" diameter="1.778"/>
<wire x1="0" y1="0" x2="38.1" y2="0" width="0.127" layer="21"/>
<wire x1="38.1" y1="0" x2="38.1" y2="21.59" width="0.127" layer="21"/>
<wire x1="38.1" y1="21.59" x2="0" y2="21.59" width="0.127" layer="21"/>
<wire x1="0" y1="21.59" x2="0" y2="0" width="0.127" layer="21"/>
<text x="0" y="22.86" size="1.27" layer="25">&gt;NAME</text>
<text x="0" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
</package>
</packages>
<packages3d>
<package3d name="TCD00A3-A" urn="urn:adsk.eagle:package:1662662/1" type="box" library_version="1" library_locally_modified="yes">
<packageinstances>
<packageinstance name="TCD00A3-A"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="TCD00A3-A" urn="urn:adsk.eagle:symbol:1662653/1" library_version="1" library_locally_modified="yes">
<pin name="P$1" x="0" y="-22.86" length="middle" rot="R90"/>
<pin name="P$2" x="5.08" y="-22.86" length="middle" rot="R90"/>
<pin name="P$3" x="10.16" y="-22.86" length="middle" rot="R90"/>
<pin name="P$4" x="15.24" y="-22.86" length="middle" rot="R90"/>
<pin name="P$5" x="20.32" y="-22.86" length="middle" rot="R90"/>
<pin name="P$6" x="25.4" y="-22.86" length="middle" rot="R90"/>
<pin name="P$7" x="30.48" y="-22.86" length="middle" rot="R90"/>
<pin name="P$8" x="35.56" y="-22.86" length="middle" rot="R90"/>
<pin name="P$9" x="40.64" y="-22.86" length="middle" rot="R90"/>
<pin name="P$10" x="40.64" y="5.08" length="middle" rot="R270"/>
<pin name="P$11" x="35.56" y="5.08" length="middle" rot="R270"/>
<pin name="P$12" x="30.48" y="5.08" length="middle" rot="R270"/>
<pin name="P$13" x="25.4" y="5.08" length="middle" rot="R270"/>
<pin name="P$14" x="20.32" y="5.08" length="middle" rot="R270"/>
<pin name="P$15" x="15.24" y="5.08" length="middle" rot="R270"/>
<pin name="P$16" x="10.16" y="5.08" length="middle" rot="R270"/>
<pin name="P$17" x="5.08" y="5.08" length="middle" rot="R270"/>
<pin name="P$18" x="0" y="5.08" length="middle" rot="R270"/>
<wire x1="-5.08" y1="0" x2="45.72" y2="0" width="0.254" layer="94"/>
<wire x1="45.72" y1="0" x2="45.72" y2="-17.78" width="0.254" layer="94"/>
<wire x1="45.72" y1="-17.78" x2="-5.08" y2="-17.78" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-17.78" x2="-5.08" y2="0" width="0.254" layer="94"/>
<text x="-7.62" y="-17.78" size="1.27" layer="95" rot="R90">&gt;NAME</text>
<text x="48.26" y="-17.78" size="1.27" layer="96" rot="R90">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="TCD00A3-A" urn="urn:adsk.eagle:component:1662664/1" locally_modified="yes" prefix="LED" library_version="1" library_locally_modified="yes">
<description>3 Digits 14 Segment LED Display</description>
<gates>
<gate name="G$1" symbol="TCD00A3-A" x="-20.32" y="10.16"/>
</gates>
<devices>
<device name="" package="TCD00A3-A">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$10" pad="P$10"/>
<connect gate="G$1" pin="P$11" pad="P$11"/>
<connect gate="G$1" pin="P$12" pad="P$12"/>
<connect gate="G$1" pin="P$13" pad="P$13"/>
<connect gate="G$1" pin="P$14" pad="P$14"/>
<connect gate="G$1" pin="P$15" pad="P$15"/>
<connect gate="G$1" pin="P$16" pad="P$16"/>
<connect gate="G$1" pin="P$17" pad="P$17"/>
<connect gate="G$1" pin="P$18" pad="P$18"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
<connect gate="G$1" pin="P$3" pad="P$3"/>
<connect gate="G$1" pin="P$4" pad="P$4"/>
<connect gate="G$1" pin="P$5" pad="P$5"/>
<connect gate="G$1" pin="P$6" pad="P$6"/>
<connect gate="G$1" pin="P$7" pad="P$7"/>
<connect gate="G$1" pin="P$8" pad="P$8"/>
<connect gate="G$1" pin="P$9" pad="P$9"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:1662662/1"/>
</package3dinstances>
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
<class number="1" name="driver" width="0" drill="0">
</class>
</classes>
<parts>
<part name="HT1" library="ScoreBoard" deviceset="HT16K33" device=""/>
<part name="HT2" library="ScoreBoard" deviceset="HT16K33" device=""/>
<part name="HT3" library="ScoreBoard" deviceset="HT16K33" device=""/>
<part name="U1" library="ScoreBoard" deviceset="NODEMCU_V2" device=""/>
<part name="P+1" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="+5V" device=""/>
<part name="P+2" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="+5V" device=""/>
<part name="P+3" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="+5V" device=""/>
<part name="P+4" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="+5V" device=""/>
<part name="GND1" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="GND2" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="GND3" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="GND4" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="LED1" library="ScoreBoard" library_urn="urn:adsk.eagle:library:1662644" deviceset="TCD00A3-A" device="" package3d_urn="urn:adsk.eagle:package:1662662/1"/>
<part name="LED2" library="ScoreBoard" library_urn="urn:adsk.eagle:library:1662644" deviceset="TCD00A3-A" device="" package3d_urn="urn:adsk.eagle:package:1662662/1"/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="HT1" gate="G$1" x="7.62" y="58.42"/>
<instance part="HT2" gate="G$1" x="63.5" y="58.42"/>
<instance part="HT3" gate="G$1" x="121.92" y="58.42"/>
<instance part="U1" gate="G$1" x="7.62" y="-48.26"/>
<instance part="P+1" gate="1" x="-7.62" y="-132.08" rot="R180"/>
<instance part="P+2" gate="1" x="48.26" y="71.12"/>
<instance part="P+3" gate="1" x="104.14" y="71.12"/>
<instance part="P+4" gate="1" x="162.56" y="71.12"/>
<instance part="GND1" gate="1" x="5.08" y="71.12" rot="R180"/>
<instance part="GND2" gate="1" x="60.96" y="71.12" rot="R180"/>
<instance part="GND3" gate="1" x="119.38" y="71.12" rot="R180"/>
<instance part="GND4" gate="1" x="-12.7" y="-132.08"/>
<instance part="LED1" gate="G$1" x="-134.62" y="71.12"/>
<instance part="LED2" gate="G$1" x="-134.62" y="30.48"/>
</instances>
<busses>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="SD0"/>
<wire x1="2.54" y1="-83.82" x2="7.62" y2="-83.82" width="0.1524" layer="91"/>
<wire x1="2.54" y1="-83.82" x2="2.54" y2="-25.4" width="0.1524" layer="91"/>
<wire x1="2.54" y1="-25.4" x2="55.88" y2="-25.4" width="0.1524" layer="91"/>
<pinref part="HT3" gate="G$1" pin="SDA"/>
<wire x1="55.88" y1="-25.4" x2="114.3" y2="-25.4" width="0.1524" layer="91"/>
<wire x1="114.3" y1="-25.4" x2="180.34" y2="-25.4" width="0.1524" layer="91"/>
<wire x1="180.34" y1="-25.4" x2="180.34" y2="53.34" width="0.1524" layer="91"/>
<wire x1="180.34" y1="53.34" x2="160.02" y2="53.34" width="0.1524" layer="91"/>
<pinref part="HT1" gate="G$1" pin="SDA"/>
<wire x1="45.72" y1="53.34" x2="55.88" y2="53.34" width="0.1524" layer="91"/>
<wire x1="55.88" y1="53.34" x2="55.88" y2="-25.4" width="0.1524" layer="91"/>
<junction x="55.88" y="-25.4"/>
<pinref part="HT2" gate="G$1" pin="SDA"/>
<wire x1="101.6" y1="53.34" x2="114.3" y2="53.34" width="0.1524" layer="91"/>
<wire x1="114.3" y1="53.34" x2="114.3" y2="-25.4" width="0.1524" layer="91"/>
<junction x="114.3" y="-25.4"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="CLK"/>
<wire x1="-2.54" y1="-88.9" x2="7.62" y2="-88.9" width="0.1524" layer="91"/>
<wire x1="-2.54" y1="-88.9" x2="-2.54" y2="-20.32" width="0.1524" layer="91"/>
<wire x1="-2.54" y1="-20.32" x2="50.8" y2="-20.32" width="0.1524" layer="91"/>
<pinref part="HT3" gate="G$1" pin="SCL"/>
<wire x1="50.8" y1="-20.32" x2="109.22" y2="-20.32" width="0.1524" layer="91"/>
<wire x1="109.22" y1="-20.32" x2="175.26" y2="-20.32" width="0.1524" layer="91"/>
<wire x1="175.26" y1="-20.32" x2="175.26" y2="48.26" width="0.1524" layer="91"/>
<wire x1="175.26" y1="48.26" x2="160.02" y2="48.26" width="0.1524" layer="91"/>
<pinref part="HT1" gate="G$1" pin="SCL"/>
<wire x1="45.72" y1="48.26" x2="50.8" y2="48.26" width="0.1524" layer="91"/>
<wire x1="50.8" y1="48.26" x2="50.8" y2="-20.32" width="0.1524" layer="91"/>
<junction x="50.8" y="-20.32"/>
<pinref part="HT2" gate="G$1" pin="SCL"/>
<wire x1="101.6" y1="48.26" x2="109.22" y2="48.26" width="0.1524" layer="91"/>
<wire x1="109.22" y1="48.26" x2="109.22" y2="-20.32" width="0.1524" layer="91"/>
<junction x="109.22" y="-20.32"/>
</segment>
</net>
<net name="+5V" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="VIN"/>
<pinref part="P+1" gate="1" pin="+5V"/>
<wire x1="7.62" y1="-119.38" x2="-7.62" y2="-119.38" width="0.1524" layer="91"/>
<wire x1="-7.62" y1="-119.38" x2="-7.62" y2="-129.54" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="HT1" gate="G$1" pin="VDD"/>
<pinref part="P+2" gate="1" pin="+5V"/>
<wire x1="45.72" y1="58.42" x2="48.26" y2="58.42" width="0.1524" layer="91"/>
<wire x1="48.26" y1="58.42" x2="48.26" y2="68.58" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="HT2" gate="G$1" pin="VDD"/>
<wire x1="101.6" y1="58.42" x2="104.14" y2="58.42" width="0.1524" layer="91"/>
<pinref part="P+3" gate="1" pin="+5V"/>
<wire x1="104.14" y1="58.42" x2="104.14" y2="68.58" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="HT3" gate="G$1" pin="VDD"/>
<wire x1="160.02" y1="58.42" x2="162.56" y2="58.42" width="0.1524" layer="91"/>
<pinref part="P+4" gate="1" pin="+5V"/>
<wire x1="162.56" y1="58.42" x2="162.56" y2="68.58" width="0.1524" layer="91"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="GND@2"/>
<pinref part="GND4" gate="1" pin="GND"/>
<wire x1="7.62" y1="-114.3" x2="-12.7" y2="-114.3" width="0.1524" layer="91"/>
<wire x1="-12.7" y1="-114.3" x2="-12.7" y2="-129.54" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="GND1" gate="1" pin="GND"/>
<wire x1="5.08" y1="68.58" x2="5.08" y2="58.42" width="0.1524" layer="91"/>
<pinref part="HT1" gate="G$1" pin="GND"/>
<wire x1="5.08" y1="58.42" x2="7.62" y2="58.42" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="HT2" gate="G$1" pin="GND"/>
<wire x1="63.5" y1="58.42" x2="60.96" y2="58.42" width="0.1524" layer="91"/>
<pinref part="GND2" gate="1" pin="GND"/>
<wire x1="60.96" y1="58.42" x2="60.96" y2="68.58" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="HT3" gate="G$1" pin="GND"/>
<wire x1="121.92" y1="58.42" x2="119.38" y2="58.42" width="0.1524" layer="91"/>
<pinref part="GND3" gate="1" pin="GND"/>
<wire x1="119.38" y1="58.42" x2="119.38" y2="68.58" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="LED1" gate="G$1" pin="P$16"/>
<wire x1="-124.46" y1="76.2" x2="-124.46" y2="86.36" width="0.1524" layer="91"/>
<wire x1="-124.46" y1="86.36" x2="-2.54" y2="86.36" width="0.1524" layer="91"/>
<wire x1="-2.54" y1="86.36" x2="-2.54" y2="53.34" width="0.1524" layer="91"/>
<pinref part="HT1" gate="G$1" pin="C0"/>
<wire x1="-2.54" y1="53.34" x2="7.62" y2="53.34" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="LED1" gate="G$1" pin="P$11"/>
<wire x1="-99.06" y1="76.2" x2="-99.06" y2="83.82" width="0.1524" layer="91"/>
<wire x1="-99.06" y1="83.82" x2="-5.08" y2="83.82" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="83.82" x2="-5.08" y2="48.26" width="0.1524" layer="91"/>
<pinref part="HT1" gate="G$1" pin="C1"/>
<wire x1="-5.08" y1="48.26" x2="7.62" y2="48.26" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="LED1" gate="G$1" pin="P$3"/>
<wire x1="-124.46" y1="48.26" x2="-124.46" y2="43.18" width="0.1524" layer="91"/>
<pinref part="HT1" gate="G$1" pin="C2"/>
<wire x1="-124.46" y1="43.18" x2="7.62" y2="43.18" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="LED2" gate="G$1" pin="P$16"/>
<wire x1="-124.46" y1="35.56" x2="-124.46" y2="40.64" width="0.1524" layer="91"/>
<pinref part="HT1" gate="G$1" pin="C3"/>
<wire x1="-124.46" y1="40.64" x2="5.08" y2="40.64" width="0.1524" layer="91"/>
<wire x1="5.08" y1="40.64" x2="7.62" y2="38.1" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="LED2" gate="G$1" pin="P$11"/>
<wire x1="-99.06" y1="35.56" x2="-99.06" y2="38.1" width="0.1524" layer="91"/>
<pinref part="HT1" gate="G$1" pin="C4"/>
<wire x1="-99.06" y1="38.1" x2="2.54" y2="38.1" width="0.1524" layer="91"/>
<wire x1="2.54" y1="38.1" x2="7.62" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="LED2" gate="G$1" pin="P$3"/>
<wire x1="-124.46" y1="7.62" x2="-124.46" y2="0" width="0.1524" layer="91"/>
<wire x1="-124.46" y1="0" x2="-10.16" y2="0" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="0" x2="-10.16" y2="27.94" width="0.1524" layer="91"/>
<pinref part="HT1" gate="G$1" pin="C5"/>
<wire x1="-10.16" y1="27.94" x2="7.62" y2="27.94" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="LED1" gate="G$1" pin="P$18"/>
<wire x1="-134.62" y1="76.2" x2="-147.32" y2="76.2" width="0.1524" layer="91"/>
<wire x1="-147.32" y1="76.2" x2="-147.32" y2="35.56" width="0.1524" layer="91"/>
<pinref part="LED2" gate="G$1" pin="P$18"/>
<wire x1="-147.32" y1="35.56" x2="-134.62" y2="35.56" width="0.1524" layer="91"/>
<pinref part="HT1" gate="G$1" pin="A15"/>
<wire x1="-134.62" y1="35.56" x2="7.62" y2="12.7" width="0.1524" layer="91"/>
<junction x="-134.62" y="35.56"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="LED1" gate="G$1" pin="P$17"/>
<wire x1="-129.54" y1="76.2" x2="-129.54" y2="78.74" width="0.1524" layer="91"/>
<wire x1="-129.54" y1="78.74" x2="-144.78" y2="78.74" width="0.1524" layer="91"/>
<wire x1="-144.78" y1="78.74" x2="-144.78" y2="38.1" width="0.1524" layer="91"/>
<pinref part="LED2" gate="G$1" pin="P$17"/>
<wire x1="-144.78" y1="38.1" x2="-132.08" y2="38.1" width="0.1524" layer="91"/>
<wire x1="-132.08" y1="38.1" x2="-129.54" y2="35.56" width="0.1524" layer="91"/>
<pinref part="HT1" gate="G$1" pin="A14"/>
<wire x1="-129.54" y1="35.56" x2="7.62" y2="7.62" width="0.1524" layer="91"/>
<junction x="-129.54" y="35.56"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="LED1" gate="G$1" pin="P$15"/>
<wire x1="-119.38" y1="76.2" x2="-119.38" y2="81.28" width="0.1524" layer="91"/>
<wire x1="-119.38" y1="81.28" x2="-142.24" y2="81.28" width="0.1524" layer="91"/>
<wire x1="-142.24" y1="81.28" x2="-142.24" y2="40.64" width="0.1524" layer="91"/>
<wire x1="-142.24" y1="40.64" x2="-127" y2="40.64" width="0.1524" layer="91"/>
<pinref part="LED2" gate="G$1" pin="P$15"/>
<wire x1="-127" y1="40.64" x2="-119.38" y2="35.56" width="0.1524" layer="91"/>
<pinref part="HT1" gate="G$1" pin="A13"/>
<wire x1="-119.38" y1="35.56" x2="7.62" y2="2.54" width="0.1524" layer="91"/>
<junction x="-119.38" y="35.56"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="LED1" gate="G$1" pin="P$10"/>
<wire x1="-93.98" y1="76.2" x2="-71.12" y2="76.2" width="0.1524" layer="91"/>
<wire x1="-71.12" y1="76.2" x2="-71.12" y2="35.56" width="0.1524" layer="91"/>
<pinref part="LED2" gate="G$1" pin="P$10"/>
<wire x1="-71.12" y1="35.56" x2="-93.98" y2="35.56" width="0.1524" layer="91"/>
<pinref part="HT1" gate="G$1" pin="A9"/>
<wire x1="-93.98" y1="35.56" x2="45.72" y2="-2.54" width="0.1524" layer="91"/>
<junction x="-93.98" y="35.56"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<pinref part="LED1" gate="G$1" pin="P$12"/>
<wire x1="-104.14" y1="76.2" x2="-104.14" y2="78.74" width="0.1524" layer="91"/>
<wire x1="-104.14" y1="78.74" x2="-73.66" y2="78.74" width="0.1524" layer="91"/>
<wire x1="-73.66" y1="78.74" x2="-73.66" y2="39.37" width="0.1524" layer="91"/>
<wire x1="-73.66" y1="39.37" x2="-104.14" y2="39.37" width="0.1524" layer="91"/>
<pinref part="LED2" gate="G$1" pin="P$12"/>
<wire x1="-104.14" y1="39.37" x2="-104.14" y2="35.56" width="0.1524" layer="91"/>
<pinref part="HT1" gate="G$1" pin="A10"/>
<wire x1="-104.14" y1="35.56" x2="45.72" y2="-7.62" width="0.1524" layer="91"/>
<junction x="-104.14" y="35.56"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="LED1" gate="G$1" pin="P$13"/>
<wire x1="-109.22" y1="76.2" x2="-109.22" y2="80.01" width="0.1524" layer="91"/>
<wire x1="-109.22" y1="80.01" x2="-75.692" y2="80.01" width="0.1524" layer="91"/>
<wire x1="-75.692" y1="80.01" x2="-75.692" y2="41.91" width="0.1524" layer="91"/>
<wire x1="-75.692" y1="41.91" x2="-109.22" y2="41.91" width="0.1524" layer="91"/>
<pinref part="LED2" gate="G$1" pin="P$13"/>
<wire x1="-109.22" y1="41.91" x2="-109.22" y2="35.56" width="0.1524" layer="91"/>
<pinref part="HT1" gate="G$1" pin="A11"/>
<wire x1="-109.22" y1="35.56" x2="7.62" y2="-7.62" width="0.1524" layer="91"/>
<junction x="-109.22" y="35.56"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<pinref part="LED1" gate="G$1" pin="P$14"/>
<wire x1="-114.3" y1="76.2" x2="-114.3" y2="81.28" width="0.1524" layer="91"/>
<wire x1="-114.3" y1="81.28" x2="-77.216" y2="81.28" width="0.1524" layer="91"/>
<wire x1="-77.216" y1="81.28" x2="-77.216" y2="44.196" width="0.1524" layer="91"/>
<wire x1="-77.216" y1="44.196" x2="-114.3" y2="44.196" width="0.1524" layer="91"/>
<pinref part="LED2" gate="G$1" pin="P$14"/>
<wire x1="-114.3" y1="44.196" x2="-114.3" y2="35.56" width="0.1524" layer="91"/>
<pinref part="HT1" gate="G$1" pin="A12"/>
<wire x1="-114.3" y1="35.56" x2="7.62" y2="-2.54" width="0.1524" layer="91"/>
<junction x="-114.3" y="35.56"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<pinref part="LED1" gate="G$1" pin="P$1"/>
<wire x1="-134.62" y1="48.26" x2="-148.336" y2="48.26" width="0.1524" layer="91"/>
<wire x1="-148.336" y1="48.26" x2="-148.336" y2="7.62" width="0.1524" layer="91"/>
<pinref part="LED2" gate="G$1" pin="P$1"/>
<wire x1="-148.336" y1="7.62" x2="-134.62" y2="7.62" width="0.1524" layer="91"/>
<pinref part="HT1" gate="G$1" pin="A1"/>
<wire x1="-134.62" y1="7.62" x2="45.72" y2="38.1" width="0.1524" layer="91"/>
<junction x="-134.62" y="7.62"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<pinref part="LED1" gate="G$1" pin="P$2"/>
<wire x1="-129.54" y1="48.26" x2="-129.54" y2="46.736" width="0.1524" layer="91"/>
<wire x1="-129.54" y1="46.736" x2="-146.558" y2="46.736" width="0.1524" layer="91"/>
<wire x1="-146.558" y1="46.736" x2="-146.558" y2="5.588" width="0.1524" layer="91"/>
<wire x1="-146.558" y1="5.588" x2="-129.54" y2="5.588" width="0.1524" layer="91"/>
<pinref part="LED2" gate="G$1" pin="P$2"/>
<wire x1="-129.54" y1="5.588" x2="-129.54" y2="7.62" width="0.1524" layer="91"/>
<pinref part="HT1" gate="G$1" pin="A2"/>
<wire x1="-129.54" y1="7.62" x2="45.72" y2="33.02" width="0.1524" layer="91"/>
<junction x="-129.54" y="7.62"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<pinref part="LED1" gate="G$1" pin="P$4"/>
<wire x1="-119.38" y1="48.26" x2="-119.38" y2="45.466" width="0.1524" layer="91"/>
<wire x1="-119.38" y1="45.466" x2="-145.542" y2="45.466" width="0.1524" layer="91"/>
<wire x1="-145.542" y1="45.466" x2="-145.542" y2="4.318" width="0.1524" layer="91"/>
<wire x1="-145.542" y1="4.318" x2="-119.38" y2="4.318" width="0.1524" layer="91"/>
<pinref part="LED2" gate="G$1" pin="P$4"/>
<wire x1="-119.38" y1="4.318" x2="-119.38" y2="7.62" width="0.1524" layer="91"/>
<pinref part="HT1" gate="G$1" pin="A3"/>
<wire x1="-119.38" y1="7.62" x2="45.72" y2="27.94" width="0.1524" layer="91"/>
<junction x="-119.38" y="7.62"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<pinref part="LED1" gate="G$1" pin="P$9"/>
<wire x1="-93.98" y1="48.26" x2="-68.072" y2="48.26" width="0.1524" layer="91"/>
<wire x1="-68.072" y1="48.26" x2="-68.072" y2="7.366" width="0.1524" layer="91"/>
<pinref part="LED2" gate="G$1" pin="P$9"/>
<wire x1="-68.072" y1="7.366" x2="-93.98" y2="7.62" width="0.1524" layer="91"/>
<pinref part="HT1" gate="G$1" pin="A8"/>
<wire x1="-93.98" y1="7.62" x2="45.72" y2="2.54" width="0.1524" layer="91"/>
<junction x="-93.98" y="7.62"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<pinref part="LED1" gate="G$1" pin="P$8"/>
<wire x1="-99.06" y1="48.26" x2="-99.06" y2="47.244" width="0.1524" layer="91"/>
<wire x1="-99.06" y1="47.244" x2="-69.088" y2="47.244" width="0.1524" layer="91"/>
<wire x1="-69.088" y1="47.244" x2="-69.088" y2="5.588" width="0.1524" layer="91"/>
<wire x1="-69.088" y1="5.588" x2="-98.806" y2="5.588" width="0.1524" layer="91"/>
<pinref part="LED2" gate="G$1" pin="P$8"/>
<wire x1="-98.806" y1="5.588" x2="-99.06" y2="7.62" width="0.1524" layer="91"/>
<pinref part="HT1" gate="G$1" pin="A7"/>
<wire x1="-99.06" y1="7.62" x2="45.72" y2="7.62" width="0.1524" layer="91"/>
<junction x="-99.06" y="7.62"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<pinref part="LED1" gate="G$1" pin="P$7"/>
<wire x1="-104.14" y1="48.26" x2="-104.14" y2="45.974" width="0.1524" layer="91"/>
<wire x1="-104.14" y1="45.974" x2="-70.358" y2="45.974" width="0.1524" layer="91"/>
<wire x1="-70.358" y1="45.974" x2="-70.358" y2="3.81" width="0.1524" layer="91"/>
<wire x1="-70.358" y1="3.81" x2="-104.14" y2="3.81" width="0.1524" layer="91"/>
<pinref part="LED2" gate="G$1" pin="P$7"/>
<wire x1="-104.14" y1="3.81" x2="-104.14" y2="7.62" width="0.1524" layer="91"/>
<pinref part="HT1" gate="G$1" pin="A6"/>
<wire x1="-104.14" y1="7.62" x2="45.72" y2="12.7" width="0.1524" layer="91"/>
<junction x="-104.14" y="7.62"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<pinref part="LED1" gate="G$1" pin="P$6"/>
<wire x1="-109.22" y1="48.26" x2="-109.22" y2="45.212" width="0.1524" layer="91"/>
<wire x1="-109.22" y1="45.212" x2="-72.136" y2="45.212" width="0.1524" layer="91"/>
<wire x1="-72.136" y1="45.212" x2="-72.136" y2="2.286" width="0.1524" layer="91"/>
<wire x1="-72.136" y1="2.286" x2="-108.966" y2="2.286" width="0.1524" layer="91"/>
<pinref part="LED2" gate="G$1" pin="P$6"/>
<wire x1="-108.966" y1="2.286" x2="-109.22" y2="7.62" width="0.1524" layer="91"/>
<pinref part="HT1" gate="G$1" pin="A5"/>
<wire x1="-109.22" y1="7.62" x2="45.72" y2="17.78" width="0.1524" layer="91"/>
<junction x="-109.22" y="7.62"/>
</segment>
</net>
<net name="N$23" class="0">
<segment>
<pinref part="LED1" gate="G$1" pin="P$5"/>
<wire x1="-114.3" y1="48.26" x2="-114.3" y2="45.212" width="0.1524" layer="91"/>
<wire x1="-114.3" y1="45.212" x2="-116.586" y2="44.196" width="0.1524" layer="91"/>
<wire x1="-116.586" y1="44.196" x2="-144.018" y2="44.196" width="0.1524" layer="91"/>
<wire x1="-144.018" y1="44.196" x2="-144.018" y2="2.286" width="0.1524" layer="91"/>
<wire x1="-144.018" y1="2.286" x2="-114.3" y2="2.286" width="0.1524" layer="91"/>
<pinref part="LED2" gate="G$1" pin="P$5"/>
<wire x1="-114.3" y1="2.286" x2="-114.3" y2="7.62" width="0.1524" layer="91"/>
<pinref part="HT1" gate="G$1" pin="A4"/>
<wire x1="-114.3" y1="7.62" x2="45.72" y2="22.86" width="0.1524" layer="91"/>
<junction x="-114.3" y="7.62"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="8.2" severity="warning">
Since Version 8.2, EAGLE supports online libraries. The ids
of those online libraries will not be understood (or retained)
with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports the association of 3D packages
with devices in libraries, schematics, and board files. Those 3D
packages will not be understood (or retained) with this version.
</note>
</compatibility>
</eagle>
