      *EditData
       IDENTIFICATION DIVISION.
       PROGRAM-ID. coboltest7.
       AUTHOR. Paul Rivallin.
       DATE-WRITTEN.September 30th 2022
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 StartNum PIC 9(8)V99 VALUE 02201123.55.
       01 NoZero PIC ZZZZZZZ9.99.
       01 NoZPlusC PIC ZZ,ZZZ,ZZ9.99.
       01 Dollar PIC $$,$$$,$$9.99.
       01 BDay PIC 9(8) VALUE 03192002.
       01 ADate PIC 99/99/9999.

       PROCEDURE DIVISION. 
           MOVE StartNum TO NoZero
           DISPLAY NoZero
           MOVE StartNum TO NoZPlusC
           DISPLAY NoZPlusC
           MOVE StartNum TO Dollar
           DISPLAY Dollar
           MOVE BDay TO ADate
           DISPLAY ADate




       STOP RUN.
       