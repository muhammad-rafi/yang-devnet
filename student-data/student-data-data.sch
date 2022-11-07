<?xml version="1.0" encoding="utf-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="exslt"><sch:ns uri="http://exslt.org/dynamic" prefix="dyn"/><sch:ns uri="http://com/example/student-data" prefix="student-data"/><sch:ns uri="urn:ietf:params:xml:ns:netconf:base:1.0" prefix="nc"/><sch:let name="root" value="/nc:data"/><sch:pattern id="student-data"><sch:rule context="/nc:data/student-data:student-records/student-data:student-record/student-data:student"><sch:report test="preceding-sibling::student-data:student[student-data:student-id=current()/student-data:student-id]">Duplicate key "student-data:student-id"</sch:report><sch:report test="preceding-sibling::student-data:student[student-data:full-name=current()/student-data:full-name]">Violated uniqueness for "student-data:full-name"</sch:report></sch:rule><sch:rule context="/nc:data/student-data:student-records/student-data:student-record/student-data:student/student-data:subjects"><sch:report test=". = preceding-sibling::student-data:subjects">Duplicate leaf-list entry "<sch:value-of select="."/>".</sch:report></sch:rule><sch:rule context="/nc:data/student-data:student-records/student-data:student-info"><sch:assert test="student-data:passed-result[not(processing-instruction('dsrl'))] or student-data:failed-result[not(processing-instruction('dsrl'))] or false()">Node(s) from one case of mandatory choice "result" must exist</sch:assert></sch:rule><sch:rule context="/nc:data/student-data:student-records/student-data:student-info/student-data:student-name"><sch:report test="not(../../student-data:student-record/student-data:student/student-data:full-name=.)">Leaf "../../student-data:student-record/student-data:student/student-data:full-name" does not exist for leafref value "<sch:value-of select="."/>"</sch:report></sch:rule><sch:rule context="/nc:data/student-data:student-records/student-data:student-info/student-data:passed-result"><sch:assert test="ancestor-or-self::*[processing-instruction('dsrl')] or (../../student-data:student-record/student-data:student/student-data:grade = 'A'or (../../student-data:student-record/student-data:student/student-data:grade = 'B'or ../../student-data:student-record/student-data:student/student-data:grade = 'C'))">Node "student-data:passed-result" is only valid when "../../student-data:student-record/student-data:student/student-data:grade = 'A'or (../../student-data:student-record/student-data:student/student-data:grade = 'B'or ../../student-data:student-record/student-data:student/student-data:grade = 'C')"</sch:assert></sch:rule><sch:rule context="/nc:data/student-data:student-records/student-data:student-info/student-data:failed-result"><sch:assert test="ancestor-or-self::*[processing-instruction('dsrl')] or (../../student-data:student-record/student-data:student/student-data:grade = 'F')">Node "student-data:failed-result" is only valid when "../../student-data:student-record/student-data:student/student-data:grade = 'F'"</sch:assert></sch:rule><sch:rule context="/nc:data/student-data:student-records/student-data:student-info/student-data:passed-score-a"><sch:assert test="../../student-data:student-record/student-data:student/student-data:grade = 'A'">Student must have grade A</sch:assert></sch:rule><sch:rule context="/nc:data/student-data:student-records/student-data:student-info/student-data:passed-score-b"><sch:assert test="../../student-data:student-record/student-data:student/student-data:grade = 'B'">Student must have grade B</sch:assert></sch:rule><sch:rule context="/nc:data/student-data:student-records/student-data:student-info/student-data:passed-score-c"><sch:assert test="../../student-data:student-record/student-data:student/student-data:grade = 'C'">Student must have grade C</sch:assert></sch:rule><sch:rule context="/nc:data/student-data:student-records/student-data:student-info/student-data:failed-score"><sch:assert test="../../student-data:student-record/student-data:student/student-data:grade = 'F'">Student must have grade F</sch:assert></sch:rule><sch:rule context="/nc:data/student-data:student-records/student-data:student-info/student-data:excellent"><sch:assert test="current() = ../student-data:passed-score-a">Student must have 4.0 GPA</sch:assert></sch:rule><sch:rule context="/nc:data/student-data:student-records/student-data:student-info/student-data:good"><sch:assert test="current() &lt; 4 and current() &gt; 3.49">Student must have 3.5 or more GPA</sch:assert></sch:rule><sch:rule context="/nc:data/student-data:student-records/student-data:student-info/student-data:need-improvement"><sch:assert test="(current() &lt; 3.25 and current() &gt; 2.99)">Student must have 3.0 GPA</sch:assert></sch:rule><sch:rule context="/nc:data/student-data:student-records/student-data:student-info/student-data:poor"><sch:assert test="current() &lt; 0.25">Student must have less than 0.25 GPA</sch:assert></sch:rule></sch:pattern></sch:schema>