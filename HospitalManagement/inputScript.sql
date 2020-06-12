-- set data for Doctor table
insert into Doctor values ('&D_SSN', '&FirstName', '&LastName', '&Speciality', &YrExp, &PhoneNo);

-- set data for Primary_Doctor table
insert into Primary_Doctor values ('&D_SSN');

-- set data for Specialist table
insert into Specialist values ('&D_SSN');

-- set data for Patient table
insert into Patient values ('&P_SSN','&FirstName','&LastName','&Address',to_date('&DOB','DD-MM-YYYY'),'&D_SSN');

-- set data for Medicine
insert into Medicine values ('&TradeName', &UnitPrice, '&GenericFlag');

-- set data for Prescription
insert into Prescription values ('&Id', to_date('&DOB','DD-MM-YYYY'), '&Doctor_SSN', '&Patient_SSN');

-- set data for Prescription_Medicine
insert into Prescription_Medicine values ('&PrescriptionId', '&TradeName', NumOfUnits);