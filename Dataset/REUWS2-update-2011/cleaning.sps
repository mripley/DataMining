*
* REUWS-2 Anonymization
*.


*
* Anonymize by location:
*.
delete variables CustomerName StreetNumber StreetName Unit HomePhone PremiseID ServiceAddress PremID Phone debtor_no NAME serv_street_no serv_street_mod serv_street serv_type serv_unit.
delete variables CUSTOMER_NAME SERVICE_NUM SERVICE_NME MAIL_LINE1 MAIL_LINE2 MAIL_LINE3 MAIL_LINE4.
delete variables Zip4.

*
* Anonymize by code:
*.
delete variables AccountID CustomerID MeterIDNumber MeterID Tap CustID Meter Serial meter_no id.

*
* Prune boring stuff
*. 
delete variables Clayton_Unit1000Gallons IrrigationAccountifoneexists Irrigationcustidifoneexists occupant_code Total_usage_hi q1000seq Count @2010use Rows AnyDuplicateRows round.
delete variables  PRIVACY ACCTNO MFGKEY PRCLKEY ADDRKEY ServiceType MODELNO SERNO UNITID 
    MeterFound Exclude Irrigation_TAP_N lagid duplicate.

delete variables q7miss to q52miss q52e q41agrp to q41egrp.


