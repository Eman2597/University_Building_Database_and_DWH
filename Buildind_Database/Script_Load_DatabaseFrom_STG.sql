-------------------- Load Department table----------------
INSERT INTO [HumanResources].[Department] ([Dname])
SELECT DISTINCT [Teacher_department] 
FROM [UniversityDB].[STG].[Data]
where [Teacher_department] is not null;

Go
-------------- Load Program table ------------------
INSERT INTO [Students].[Program] ([Department], [Specialization], [PDescription])
SELECT DISTINCT [department], [specialization], (N'���� '+[department]+N' ����'+[specialization]) [PDescription]
FROM [UniversityDB].[STG].[Data]
--where [Teacher_department] is not null;
Go
GO

-------------- Load Student table ----------------------
INSERT INTO [Students].[Student] ([S_ID], [Sname], [Semail], [SStatus], [Slevel], [PID])
SELECT DISTINCT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], [student_name], [student_email], [student_status], [studentGrade], [Students].[Program].[PID]
FROM [UniversityDB].[STG].[Data]
join [UniversityDB].[Students].[Program] 
ON [UniversityDB].[Students].[Program].[Department] = [UniversityDB].[STG].[Data].department
and [UniversityDB].[Students].[Program].[Specialization] = [UniversityDB].[STG].[Data].specialization;

----------------- Load Instructor table-------------
INSERT INTO [HumanResources].[Instructor] ([InsID], [Ins_name], [Degree], [Ins_Phone], [Ins_email], [DID])
SELECT distinct (CAST(SUBSTRING(([Teacher_name]), 12, 18) AS int))[Teacher_ID], [Teacher_name], [Teacher_degree], [Teacher_telephone], [Teacher_email], [HumanResources].[Department].[DID]
FROM [UniversityDB].[STG].[Data]
join [UniversityDB].[HumanResources].[Department] 
ON [UniversityDB].[HumanResources].[Department].[Dname] = [UniversityDB].[STG].[Data].[Teacher_department]
where [Teacher_name] is not null;
Go

------------Load cource table-----------------
INSERT INTO [Cources].[cource] ([CID], [Cname], [gradelevel], [score_written], [with_written], [Bubble_sheet], [InsID], [PID])
SELECT distinct (CAST(SUBSTRING(([subject_code]), 9, 18) AS int))[CID], [subject_title], [subject_Grade],[score_written], [with_written], [Bubble_sheet],(CAST(SUBSTRING(([Teacher_name]), 12, 18) AS int))[InsID], [Students].[Program].[PID]
FROM [UniversityDB].[STG].[Data]
join [UniversityDB].[Students].[Program] 
ON [UniversityDB].[Students].[Program].[Department] = [UniversityDB].[STG].[Data].department
and [UniversityDB].[Students].[Program].[Specialization] = [UniversityDB].[STG].[Data].specialization
Go

------------Load Student_cource table -----------------
INSERT INTO [Cources].[Student_cource] ([S_ID], [CID], [score_Grade], [score_percent])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], [Cources].[cource].[CID], [STG].[Data].[score], [STG].[Data].[percent]
FROM [UniversityDB].[STG].[Data]
join [UniversityDB].[Cources].[cource]
ON [UniversityDB].[STG].[Data].[subject_title] = [UniversityDB].[Cources].[cource].[Cname]
Go

---------- Load Feedback_Questions table----------------
INSERT INTO [Feedback].[Feedback_Questions] ([QuestionID], [QuestionCategory], [QuestionText])
SELECT [w] AS [QuestionID], N'����� ����� ������' AS [QuestionCategory], [����� ����� ������] AS [QuestionText]
FROM [UniversityDB].[STG].[Question_Text]
where [w] is not null
Go
----------------
INSERT INTO [Feedback].[Feedback_Questions] ([QuestionID], [QuestionCategory], [QuestionText])
SELECT [x] AS [QuestionID], N'����� ��� ���� �������' AS [QuestionCategory], [����� ��� ���� �������] AS [QuestionText]
FROM [UniversityDB].[STG].[Question_Text]
where [x] is not null
Go
------------------
INSERT INTO [Feedback].[Feedback_Questions] ([QuestionID], [QuestionCategory], [QuestionText])
SELECT [y] AS [QuestionID], N'����� ���������� ����������' AS [QuestionCategory], [����� ���������� ����������] AS [QuestionText]
FROM [UniversityDB].[STG].[Question_Text]
where [y] is not null
Go
------------------
INSERT INTO [Feedback].[Feedback_Questions] ([QuestionID], [QuestionCategory], [QuestionText])
SELECT [z] AS [QuestionID], N'����� ���� ������' AS [QuestionCategory], [����� ���� ������] AS [QuestionText]
FROM [UniversityDB].[STG].[Question_Text]
where [z] is not null
Go
-----------------
INSERT INTO [Feedback].[Feedback_Questions] ([QuestionID], [QuestionCategory], [QuestionText])
SELECT [Text] AS [QuestionID], N'������� ��������' AS [QuestionCategory], [������� ��������] AS [QuestionText]
FROM [UniversityDB].[STG].[Question_Text]
where [Text] is not null
Go

---------Load Feedback_Student table-------------
---100--w-----
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 100 AS [QuestionID], [STG].[Data].[w1]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[w1] is not null 
Go
---101-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 101 AS [QuestionID], [STG].[Data].[w2]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[w2] is not null 
GO
---102-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 102 AS [QuestionID], [STG].[Data].[w3]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[w3] is not null 
GO
---103-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 103 AS [QuestionID], [STG].[Data].[w4]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[w4] is not null 
GO
---104-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 104 AS [QuestionID], [STG].[Data].[w5]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[w5] is not null 
GO
---105-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 105 AS [QuestionID], [STG].[Data].[w6]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[w6] is not null 
GO
---106-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 106 AS [QuestionID], [STG].[Data].[w7]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[w7] is not null 
GO
---107-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 107 AS [QuestionID], [STG].[Data].[w8]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[w8] is not null 
GO
---108-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 108 AS [QuestionID], [STG].[Data].[w9]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[w9] is not null 
GO
---109-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 109 AS [QuestionID], [STG].[Data].[w10]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[w10] is not null 
GO
---110-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 110 AS [QuestionID], [STG].[Data].[w11]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[w11] is not null 
GO
---200---x----
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 200 AS [QuestionID], [STG].[Data].[x1]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[x1] is not null 
GO
---201-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 201 AS [QuestionID], [STG].[Data].[x2]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[x2] is not null 
GO
---202-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 202 AS [QuestionID], [STG].[Data].[x3]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[x3] is not null 
GO

---203---x----
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 203 AS [QuestionID], [STG].[Data].[x4]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[x4] is not null 
GO

---204-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 204 AS [QuestionID], [STG].[Data].[x5]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[x5] is not null 
GO

---205-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 205 AS [QuestionID], [STG].[Data].[x6]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[x6] is not null 
GO

---206-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 206 AS [QuestionID], [STG].[Data].[x7]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[x7] is not null 
GO

---207-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 207 AS [QuestionID], [STG].[Data].[x8]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[x8] is not null 
GO

---208-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 208 AS [QuestionID], [STG].[Data].[x9]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[x9] is not null 
GO

---209-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 209 AS [QuestionID], [STG].[Data].[x10]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[x10] is not null 
GO

---210-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 210 AS [QuestionID], [STG].[Data].[x11]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[x11] is not null 
GO

---211-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 211 AS [QuestionID], [STG].[Data].[x12]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[x12] is not null 
GO

---212-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 212 AS [QuestionID], [STG].[Data].[x13]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[x13] is not null 
GO

---213-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 213 AS [QuestionID], [STG].[Data].[x14]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[x14] is not null 
GO

---300---y----
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 300 AS [QuestionID], [STG].[Data].[y1]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[y1] is not null 
GO

---301-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 301 AS [QuestionID], [STG].[Data].[y2]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[y2] is not null 
GO

---302-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 302 AS [QuestionID], [STG].[Data].[y3]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[y3] is not null 
GO

---303-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 303 AS [QuestionID], [STG].[Data].[y4]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[y4] is not null 
GO

---304-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 304 AS [QuestionID], [STG].[Data].[y5]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[y5] is not null 
GO

---305-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 305 AS [QuestionID], [STG].[Data].[y6]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[y6] is not null 
GO

---400---z----
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 400 AS [QuestionID], [STG].[Data].[z1]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[z1] is not null 
GO

---401-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 401 AS [QuestionID], [STG].[Data].[z2]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[z2] is not null 
GO

---402-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 402 AS [QuestionID], [STG].[Data].[z3]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[z3] is not null 
GO

---403-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 403 AS [QuestionID], [STG].[Data].[z4]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[z4] is not null 
GO

---404-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 404 AS [QuestionID], [STG].[Data].[z5]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[z5] is not null 
GO

---405-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 405 AS [QuestionID], [STG].[Data].[z6]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[z6] is not null 
GO

---406-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 406 AS [QuestionID], [STG].[Data].[z7]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[z7] is not null 
GO

---407-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 407 AS [QuestionID], [STG].[Data].[z8]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[z8] is not null 
GO

---500---open----
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 500 AS [QuestionID], [STG].[Data].[Pros]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[Pros] is not null 
GO

---501-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 501 AS [QuestionID], [STG].[Data].[Cons]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[Cons] is not null 
GO

---502-------
INSERT INTO [Feedback].[Student_Feedback] ([S_ID], [CID], [QuestionID], [Response])
SELECT CAST(SUBSTRING([student_id], 9, 15) AS int)[student_id], CAST(SUBSTRING([subject_code], 9, 18) AS int)[CID], 502 AS [QuestionID], [STG].[Data].[Suggestions]
FROM [UniversityDB].[STG].[Data]
--where [UniversityDB].[STG].[Data].[Suggestions] is not null 
GO