      *files
       IDENTIFICATION DIVISION.
       PROGRAM-ID. coboltest10.
       AUTHOR. Paul Rivallin.
       DATE-WRITTEN.September 30th 2022
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CustomerReport ASSIGN TO "CustReport.rpt"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT CustomerFile ASSIGN TO "Customer.dat"
               ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD CustomerReport.
       01 PrintLine PIC X(50).

       FD CustomerFile.
       01 CustomerData.
           02 BirthDate PIC 9(8).
           02 IDNum PIC 9(5).
           02 CustName.
               03 FirstName PIC X(12).
               03 LastName PIC X(15).
           
           88 WSEOF VALUE HIGH-VALUE.
           88 CEData VALUE 0.
       01 DOB PIC 9(2) VALUE ZEROS.
       01 MOB PIC 9(2) VALUE ZEROS.
       01 YOB PIC 9(4) VALUE ZEROS.

       WORKING-STORAGE SECTION.
       77 Loop PIC X VALUE HIGH-VALUE.
       77 KeyPressed PIC X.
       01 WSCustomer.
           02 WSIDNum PIC 9(5).
           02 WSCustName.
               03 WSFirstName PIC X(12).
               03 WSLastName PIC X(15).
       01 PageHeading.
           02 FILLER PIC X(16) VALUE "Customers List :".
       01 PageFooting.
           02 FILLER PIC X(15) VALUE SPACE.
           02 FILLER PIC X(7) VALUE "Page : ".
           02 PrnPageNum PIC Z9.
       01 Heads PIC X(55) VALUE "IDNum    FirstName    LastName    " &
           "     DD/MM/YYYY : ".
       01 CustomerDetailLine.
           02 FILLER PIC X VALUE SPACE.
           02 PrnCustID PIC 9(5).
           02 FILLER PIC X(4) VALUE SPACE.
           02 PrnFirstName PIC X(12).
           02 FILLER PIC X VALUE SPACE.
           02 PrnLastName PIC X(15).
           02 FILLER PIC X VALUE SPACE.
           
           02 PrnDOB PIC 99.
           02 FILLER PIC X VALUE "/".
           02 PrnMOB PIC 99.
           02 FILLER PIC X VALUE "/".
           02 PrnYOB PIC 9(4).
       01 ReportFooting PIC X(13) VALUE "END OF REPORT".
       01 LineCount PIC 99 VALUE ZERO.
           88 NewPageRequired VALUE 40 THRU 99.
       01 PageCount PIC 99 VALUE ZERO.

       SCREEN SECTION.
       01 1stScreen.
           02 LINE 1 VALUE "------------------------------" &
               "---------------".
           02 LINE 2 VALUE "/                             " &
               "              /".
           02 LINE 3 VALUE "/               Customers List:         " &
               "    /".
           02 LINE 4 VALUE "/                             " &
               "              /".
           02 LINE 5 VALUE "/                             " &
               "              /".
           02 LINE 6 VALUE "/                             " &
               "              /".
           02 LINE 7 COLUMN 1 VALUE "/ Appuyer sur une touche pour " &
               "continuer...  /".
           02 LINE 7 COLUMN 43 PIC X TO KeyPressed.
           02 LINE 8 VALUE "/                             " &
               "              /".
           02 LINE 9 VALUE "/                             " &
               "              /".
           02 LINE 10 VALUE "/                             " &
               "              /".
           02 LINE 11 VALUE "------------------------------" &
               "---------------".
       01 2stScreen.
           02 LINE 1 VALUE "----------------/Report List/--" &
               "--------------".
           02 LINE 2 VALUE "/                             " &
               "              /".
           02 LINE 3 VALUE "/ IDNum: FstName:   LstName:    " &
               "DD/MM/YYYY: /".
           02 LINE 4 VALUE "/                             " &
               "              /".
           02 LINE 5 VALUE "/                             " &
               "              /".
           02 LINE 6 VALUE "/                             " &
               "              /".
           02 LINE 7 VALUE "/                             " &
               "              /".
           02 LINE 8 VALUE "/                             " &
               "              /".
           02 LINE 9 VALUE "/                             " &
               "              /".
           02 LINE 10 VALUE "/                             " &
               "              /".
           02 LINE 11 VALUE "---------------------(1)------" &
               "---------------".
           
       01 Entries.
           02 LINE 1 VALUE "Customer ID : ".
       
       01 ClearScreen.
           02 BLANK SCREEN.
          
       PROCEDURE DIVISION.
           PERFORM WITH TEST AFTER UNTIL Loop = "N"
           
               OPEN EXTEND CustomerFile
                   DISPLAY Entries
                   ACCEPT IDNum COLUMN 14
                   DISPLAY ClearScreen
                   DISPLAY "Customer First Name : " WITH NO ADVANCING
                   ACCEPT FirstName COLUMN 22
                   DISPLAY ClearScreen
                   DISPLAY "Customer Last Name : " WITH NO ADVANCING
                   ACCEPT LastName COLUMN 21
                   DISPLAY ClearScreen
                   DISPLAY "Customer Birth Day DDMMYYYY : " WITH NO
                   ADVANCING
                   ACCEPT BirthDate COLUMN 31
                   WRITE CustomerData
                   END-WRITE
               CLOSE CustomerFile
               DISPLAY ClearScreen
               OPEN INPUT CustomerFile
               OPEN OUTPUT CustomerReport
               PERFORM PrintPageHeading
               READ CustomerFile
                   AT END SET WSEOF TO TRUE
               END-READ
               PERFORM PrintReportBody UNTIL WSEOF
               WRITE PrintLine FROM ReportFooting AFTER ADVANCING 5
               LINES
               CLOSE CustomerFile, CustomerReport
               DISPLAY "Do you want to continue ? Y / N : " WITH NO
               ADVANCING
               ACCEPT Loop COLUMN 34
               DISPLAY ClearScreen
               
           END-PERFORM.

           ACCEPT 1stScreen.
           DISPLAY ClearScreen.
           DISPLAY 2stScreen.


     
       STOP RUN.

       PrintPageHeading.
       WRITE PrintLine FROM PageHeading 
       WRITE PrintLine FROM Heads AFTER ADVANCING 5 LINES  
       MOVE 3 TO LineCount
       ADD 1 TO PageCount.

       PrintReportBody.
       IF NewPageRequired
           MOVE PageCount TO PrnPageNum
           WRITE PrintLine FROM PageFooting AFTER ADVANCING 5 LINES
           PERFORM PrintPageHeading
       END-IF
       MOVE IDNum TO PrnCustID
       MOVE FirstName TO PrnFirstName
       MOVE LastName TO PrnLastName
       MOVE BirthDate(1:2) TO PrnDOB
       MOVE BirthDate(3:2) TO PrnMOB
       MOVE BirthDate(5:4) TO PrnYOB
       WRITE PrintLine FROM CustomerDetailLine AFTER ADVANCING 1 LINE
       ADD 1 TO LineCount
       READ CustomerFile
           AT END SET WSEOF TO TRUE
       END-READ.
       