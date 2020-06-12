-- query 1 
select TradeName
from Medicine
where UnitPrice < 50 and GenericFlag = 'Yes';

-- query 2
select Patient.FirstName, Patient.LastName
from Patient, Doctor
where Patient.D_SSN = Doctor.D_SSN
and Doctor.FirstName = 'John' and Doctor.LastName = 'Smith';

-- query 3
select FirstName, LastName
from Doctor
where D_SSN not in (select D_SSN from Patient);

-- query 4
-- unable to form the query
select TName, UnitCount
from (select count(distinct PrescriptionId) as Pr_cnt, sum(NumOfUnits) as UnitCount, TradeName as TName
	from Prescription_Medicine group by TradeName) where Pr_cnt > 20;

-- query 5
select Prescription.Patient_SSN
from Prescription, Prescription_Medicine T, Prescription_Medicine S
where Prescription.Id = T.PrescriptionId and Prescription.Id = S.PrescriptionId
and T.TradeName = 'Aspirin' and S.TradeName = 'Vitamin';

-- query 6
select Prescription.Patient_SSN
from Prescription, Doctor, Prescription_Medicine
where Prescription_Medicine.TradeName = 'Aspirin' and Prescription_Medicine.PrescriptionId = Prescription.Id
and Doctor.D_SSN = Prescription.Doctor_SSN and Doctor.FirstName = 'John' and Doctor.LastName = 'Smith';

-- query 7
(select Patient.FirstName, Patient.LastName
from Patient, Prescription
where Patient.P_SSN = Prescription.Patient_SSN and Prescription.Doctor_SSN = Patient.D_SSN)
MINUS
(select Patient.FirstName, Patient.LastName
from Patient, Prescription
where Patient.P_SSN = Prescription.Patient_SSN and Prescription.Doctor_SSN <> Patient.D_SSN);
