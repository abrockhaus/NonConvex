/*
Vorlage für ein Skript nach der Bereitstellung							
--------------------------------------------------------------------------------------
 Diese Datei enthält SQL-Anweisungen, die an das Buildskript angefügt werden.		
 Schließen Sie mit der SQLCMD-Syntax eine Datei in das Skript nach der Bereitstellung ein.			
 Beispiel:   :r .\myfile.sql								
 Verwenden Sie die SQLCMD-Syntax, um auf eine Variable im Skript nach der Bereitstellung zu verweisen.		
 Beispiel:   :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

--Price Sources
;with s as 
(
    select 1 ID, 'Some Webshop' as Label 
) 
merge Arbitrage.PriceSource t using s on t.ID = s.ID 
when not matched by target then 
insert (ID, Label) values (s.ID, s.Label) 
when matched and t.Label <> s.Label or (t.Label is null and s.Label is not null) or (t.Label is not null and s.Label is null) then 
update set t.Label = s.Label 
when not matched by source then delete;

--Curves
;with s as 
(
    select 1 ID, 'EURCHF' Label, 'FX' Unit union all 
	select 2 ID, 'DJI Mavic Air 2 Drone mit einer 4K Videokamera' Label, 'Item' Unit
) 
merge Arbitrage.Curve t using s on t.ID = s.ID 
when not matched by target then 
insert (ID, Label, Unit) values (s.ID, s.Label, s.Unit) 
when matched and 
    t.Label <> s.Label or (t.Label is not null and s.Label is null) or (t.Label is null and s.Label is not null) or 
    t.Unit <> s.Unit or (t.Unit is not null and s.Unit is null) or (t.Unit is null and s.Unit is not null) 
then update set t.Label = s.Label, t.Unit = s.Unit 
when not matched by source then delete;
    
--Fill CurveValues with some play data
;with s as (
	select 1 CurveID, '2020-01-02' Timepoint, 1.0865 Value union all
	select 1 CurveID, '2020-01-03' Timepoint, 1.0840 Value union all
	select 1 CurveID, '2020-01-06' Timepoint, 1.0850 Value union all
	select 1 CurveID, '2020-01-07' Timepoint, 1.0850 Value union all
	select 1 CurveID, '2020-01-08' Timepoint, 1.0792 Value union all
	select 1 CurveID, '2020-01-09' Timepoint, 1.0808 Value union all
	select 1 CurveID, '2020-01-10' Timepoint, 1.0822 Value union all
	select 1 CurveID, '2020-01-13' Timepoint, 1.0811 Value union all
	select 1 CurveID, '2020-01-14' Timepoint, 1.0767 Value union all
	select 1 CurveID, '2020-01-15' Timepoint, 1.0751 Value union all
	select 1 CurveID, '2020-01-16' Timepoint, 1.0739 Value union all
	select 1 CurveID, '2020-01-17' Timepoint, 1.0736 Value union all
	select 1 CurveID, '2020-01-20' Timepoint, 1.0737 Value union all
	select 1 CurveID, '2020-01-21' Timepoint, 1.0743 Value union all
	select 1 CurveID, '2020-01-22' Timepoint, 1.0757 Value union all
	select 1 CurveID, '2020-01-23' Timepoint, 1.0734 Value union all
	select 1 CurveID, '2020-01-24' Timepoint, 1.0712 Value union all
	select 1 CurveID, '2020-01-27' Timepoint, 1.0689 Value union all
	select 1 CurveID, '2020-01-28' Timepoint, 1.0703 Value union all
	select 1 CurveID, '2020-01-29' Timepoint, 1.0729 Value union all
	select 1 CurveID, '2020-01-30' Timepoint, 1.0690 Value union all
	select 1 CurveID, '2020-01-31' Timepoint, 1.0694 Value union all
	select 1 CurveID, '2020-02-03' Timepoint, 1.0672 Value union all
	select 1 CurveID, '2020-02-04' Timepoint, 1.0702 Value union all
	select 1 CurveID, '2020-02-05' Timepoint, 1.0717 Value union all
	select 1 CurveID, '2020-02-06' Timepoint, 1.0715 Value union all
	select 1 CurveID, '2020-02-07' Timepoint, 1.0705 Value union all
	select 1 CurveID, '2020-02-10' Timepoint, 1.0700 Value union all
	select 1 CurveID, '2020-02-11' Timepoint, 1.0667 Value union all
	select 1 CurveID, '2020-02-12' Timepoint, 1.0645 Value union all
	select 1 CurveID, '2020-02-13' Timepoint, 1.0633 Value union all
	select 1 CurveID, '2020-02-14' Timepoint, 1.0641 Value union all
	select 1 CurveID, '2020-02-17' Timepoint, 1.0641 Value union all
	select 1 CurveID, '2020-02-18' Timepoint, 1.0619 Value union all
	select 1 CurveID, '2020-02-19' Timepoint, 1.0621 Value union all
	select 1 CurveID, '2020-02-20' Timepoint, 1.0616 Value union all
	select 1 CurveID, '2020-02-21' Timepoint, 1.0610 Value union all
	select 1 CurveID, '2020-02-24' Timepoint, 1.0600 Value union all
	select 1 CurveID, '2020-02-25' Timepoint, 1.0605 Value union all
	select 1 CurveID, '2020-02-26' Timepoint, 1.0606 Value union all
	select 1 CurveID, '2020-02-27' Timepoint, 1.0627 Value union all
	select 1 CurveID, '2020-02-28' Timepoint, 1.0614 Value union all
	select 1 CurveID, '2020-03-02' Timepoint, 1.0655 Value union all
	select 1 CurveID, '2020-03-03' Timepoint, 1.0646 Value union all
	select 1 CurveID, '2020-03-04' Timepoint, 1.0647 Value union all
	select 1 CurveID, '2020-03-05' Timepoint, 1.0663 Value union all
	select 1 CurveID, '2020-03-06' Timepoint, 1.0589 Value union all
	select 1 CurveID, '2020-03-09' Timepoint, 1.0594 Value union all
	select 1 CurveID, '2020-03-10' Timepoint, 1.0594 Value union all
	select 1 CurveID, '2020-03-11' Timepoint, 1.0591 Value union all
	select 1 CurveID, '2020-03-12' Timepoint, 1.0549 Value union all
	select 1 CurveID, '2020-03-13' Timepoint, 1.0608 Value union all
	select 1 CurveID, '2020-03-16' Timepoint, 1.0546 Value union all
	select 1 CurveID, '2020-03-17' Timepoint, 1.0561 Value union all
	select 1 CurveID, '2020-03-18' Timepoint, 1.0546 Value union all
	select 1 CurveID, '2020-03-19' Timepoint, 1.0535 Value union all
	select 1 CurveID, '2020-03-20' Timepoint, 1.0546 Value union all
	select 1 CurveID, '2020-03-23' Timepoint, 1.0590 Value union all
	select 1 CurveID, '2020-03-24' Timepoint, 1.0572 Value union all
	select 1 CurveID, '2020-03-25' Timepoint, 1.0602 Value union all
	select 1 CurveID, '2020-03-26' Timepoint, 1.0634 Value union all
	select 1 CurveID, '2020-03-27' Timepoint, 1.0581 Value union all
	select 1 CurveID, '2020-03-30' Timepoint, 1.0571 Value union all
	select 1 CurveID, '2020-03-31' Timepoint, 1.0585 Value union all
	select 1 CurveID, '2020-04-01' Timepoint, 1.0564 Value union all
	select 1 CurveID, '2020-04-02' Timepoint, 1.0551 Value union all
	select 1 CurveID, '2020-04-03' Timepoint, 1.0547 Value union all
	select 1 CurveID, '2020-04-06' Timepoint, 1.0560 Value union all
	select 1 CurveID, '2020-04-07' Timepoint, 1.0582 Value union all
	select 1 CurveID, '2020-04-08' Timepoint, 1.0557 Value union all
	select 1 CurveID, '2020-04-09' Timepoint, 1.0558 Value union all
	select 1 CurveID, '2020-04-14' Timepoint, 1.0543 Value union all
	select 1 CurveID, '2020-04-15' Timepoint, 1.0534 Value union all
	select 1 CurveID, '2020-04-16' Timepoint, 1.0516 Value union all
	select 1 CurveID, '2020-04-17' Timepoint, 1.0515 Value union all
	select 1 CurveID, '2020-04-20' Timepoint, 1.0518 Value union all
	select 1 CurveID, '2020-04-21' Timepoint, 1.0517 Value union all
	select 1 CurveID, '2020-04-22' Timepoint, 1.0523 Value union all
	select 1 CurveID, '2020-04-23' Timepoint, 1.0511 Value union all
	select 1 CurveID, '2020-04-24' Timepoint, 1.0525 Value union all
	select 1 CurveID, '2020-04-27' Timepoint, 1.0557 Value union all
	select 1 CurveID, '2020-04-28' Timepoint, 1.0586 Value union all
	select 1 CurveID, '2020-04-29' Timepoint, 1.0571 Value union all
	select 1 CurveID, '2020-04-30' Timepoint, 1.0558 Value union all
	select 1 CurveID, '2020-05-04' Timepoint, 1.0548 Value union all
	select 1 CurveID, '2020-05-05' Timepoint, 1.0525 Value union all
	select 1 CurveID, '2020-05-06' Timepoint, 1.0530 Value union all
	select 1 CurveID, '2020-05-07' Timepoint, 1.0530 Value union all
	select 1 CurveID, '2020-05-08' Timepoint, 1.0529 Value union all
	select 1 CurveID, '2020-05-11' Timepoint, 1.0519 Value union all
	select 1 CurveID, '2020-05-12' Timepoint, 1.0520 Value union all
	select 1 CurveID, '2020-05-13' Timepoint, 1.0528 Value union all
	select 1 CurveID, '2020-05-14' Timepoint, 1.0512 Value union all
	select 1 CurveID, '2020-05-15' Timepoint, 1.0513 Value union all
	select 1 CurveID, '2020-05-18' Timepoint, 1.0521 Value union all
	select 1 CurveID, '2020-05-19' Timepoint, 1.0633 Value union all
	select 1 CurveID, '2020-05-20' Timepoint, 1.0584 Value union all
	select 1 CurveID, '2020-05-21' Timepoint, 1.0628 Value union all
	select 1 CurveID, '2020-05-22' Timepoint, 1.0591 Value union all
	select 1 CurveID, '2020-05-25' Timepoint, 1.0597 Value union all
	select 1 CurveID, '2020-05-26' Timepoint, 1.0600 Value union all
	select 1 CurveID, '2020-05-27' Timepoint, 1.0675 Value union all
	select 1 CurveID, '2020-05-28' Timepoint, 1.0683 Value union all
	select 1 CurveID, '2020-05-29' Timepoint, 1.0720 Value union all
	select 1 CurveID, '2020-06-01' Timepoint, 1.0686 Value union all
	select 1 CurveID, '2020-06-02' Timepoint, 1.0741 Value union all
	select 1 CurveID, '2020-06-03' Timepoint, 1.0793 Value union all
	select 1 CurveID, '2020-06-04' Timepoint, 1.0786 Value union all
	select 1 CurveID, '2020-06-05' Timepoint, 1.0866 Value union all
	select 1 CurveID, '2020-06-08' Timepoint, 1.0861 Value union all
	select 1 CurveID, '2020-06-09' Timepoint, 1.0770 Value union all
	select 1 CurveID, '2020-06-10' Timepoint, 1.0762 Value union all
	select 1 CurveID, '2020-06-11' Timepoint, 1.0697 Value union all
	select 1 CurveID, '2020-06-12' Timepoint, 1.0697 Value union all
	select 1 CurveID, '2020-06-15' Timepoint, 1.0679 Value union all
	select 1 CurveID, '2020-06-16' Timepoint, 1.0717 Value union all
	select 1 CurveID, '2020-06-17' Timepoint, 1.0669 Value union all
	select 1 CurveID, '2020-06-18' Timepoint, 1.0667 Value union all
	select 1 CurveID, '2020-06-19' Timepoint, 1.0656 Value union all
	select 1 CurveID, '2020-06-22' Timepoint, 1.0654 Value union all
	select 1 CurveID, '2020-06-23' Timepoint, 1.0705 Value union all
	select 1 CurveID, '2020-06-24' Timepoint, 1.0679 Value union all
	select 1 CurveID, '2020-06-25' Timepoint, 1.0637 Value union all
	select 1 CurveID, '2020-06-26' Timepoint, 1.0631 Value union all
	select 1 CurveID, '2020-06-29' Timepoint, 1.0669 Value union all
	select 1 CurveID, '2020-06-30' Timepoint, 1.0651 Value union all
	select 1 CurveID, '2020-07-01' Timepoint, 1.0620 Value union all
	select 1 CurveID, '2020-07-02' Timepoint, 1.0648 Value union all
	select 1 CurveID, '2020-07-03' Timepoint, 1.0623 Value union all
	select 1 CurveID, '2020-07-06' Timepoint, 1.0642 Value union all
	select 1 CurveID, '2020-07-07' Timepoint, 1.0643 Value union all
	select 1 CurveID, '2020-07-08' Timepoint, 1.0624 Value union all
	select 1 CurveID, '2020-07-09' Timepoint, 1.0634 Value union all
	select 1 CurveID, '2020-07-10' Timepoint, 1.0625 Value union all
	select 1 CurveID, '2020-07-13' Timepoint, 1.0685 Value union all
	select 1 CurveID, '2020-07-14' Timepoint, 1.0691 Value union all
	select 1 CurveID, '2020-07-15' Timepoint, 1.0783 Value union all
	select 1 CurveID, '2020-07-16' Timepoint, 1.0787 Value union all
	select 1 CurveID, '2020-07-17' Timepoint, 1.0753 Value union all
	select 1 CurveID, '2020-07-20' Timepoint, 1.0736 Value union all
	select 1 CurveID, '2020-07-21' Timepoint, 1.0740 Value union all
	select 1 CurveID, '2020-07-22' Timepoint, 1.0785 Value union all
	select 1 CurveID, '2020-07-23' Timepoint, 1.0731 Value union all
	select 1 CurveID, '2020-07-24' Timepoint, 1.0730 Value union all
	select 1 CurveID, '2020-07-27' Timepoint, 1.0838 Value union all
	select 1 CurveID, '2020-07-28' Timepoint, 1.0758 Value union all
	select 1 CurveID, '2020-07-29' Timepoint, 1.0766 Value union all
	select 1 CurveID, '2020-07-30' Timepoint, 1.0744 Value union all
	select 1 CurveID, '2020-07-31' Timepoint, 1.0769 Value union all
	select 1 CurveID, '2020-08-03' Timepoint, 1.0784 Value union all
	select 1 CurveID, '2020-08-04' Timepoint, 1.0761 Value union all
	select 1 CurveID, '2020-08-05' Timepoint, 1.0770 Value union all
	select 1 CurveID, '2020-08-06' Timepoint, 1.0759 Value union all
	select 1 CurveID, '2020-08-07' Timepoint, 1.0804 Value union all
	select 1 CurveID, '2020-08-10' Timepoint, 1.0790 Value union all
	select 1 CurveID, '2020-08-11' Timepoint, 1.0743 Value union all
	select 1 CurveID, '2020-08-12' Timepoint, 1.0755 Value union all
	select 1 CurveID, '2020-08-13' Timepoint, 1.0784 Value union all
	select 1 CurveID, '2020-08-14' Timepoint, 1.0754 Value union all
	select 1 CurveID, '2020-08-17' Timepoint, 1.0765 Value union all
	select 1 CurveID, '2020-08-18' Timepoint, 1.0773 Value union all
	select 1 CurveID, '2020-08-19' Timepoint, 1.0811 Value union all
	select 1 CurveID, '2020-08-20' Timepoint, 1.0786 Value union all
	select 1 CurveID, '2020-08-21' Timepoint, 1.0744 Value union all
	select 1 CurveID, '2020-08-24' Timepoint, 1.0761 Value union all
	select 1 CurveID, '2020-08-25' Timepoint, 1.0752 Value union all
	select 1 CurveID, '2020-08-26' Timepoint, 1.0738 Value union all
	select 1 CurveID, '2020-08-27' Timepoint, 1.0750 Value union all
	select 1 CurveID, '2020-08-28' Timepoint, 1.0758 Value 
), t as 
(
	select * from Arbitrage.CurveValue where CurveID = 1 
) 
merge t t using s s on t.CurveID = s.CurveID and t.Timepoint = s.Timepoint 
when not matched by target then insert (CurveID, Timepoint, Value) values (s.CurveID, s.Timepoint, s.Value) 
when matched and t.Value <> s.Value or (t.Value is null and s.Value is not null) or (t.Value is not null and s.Value is null) then update set t.Value = s.Value 
when not matched by source then delete; 

;with timeline as 
(
	select convert(datetimeoffset(7), '02 Jan 2020') Timepoint union all 
	select dateadd(day, 1, Timepoint) from timeline where dateadd(day, 1, Timepoint) <= sysdatetimeoffset() 
), s as
(
	select 
		2 CurveID, Timepoint, 
		case 
			when Timepoint < '03 Mar 2020' then 1076.120 
			when Timepoint >= '03 Mar 2020' and Timepoint < '04 Apr 2020' then 1024.11
			when Timepoint >= '04 Apr 2020' and Timepoint < '08 May 2020' then 1006.02
			when Timepoint >= '08 May 2020' and Timepoint < '24 Jul 2020' then 1004.22
			else 1001.03
		end Value 
	from timeline 
), t as 
(
	select * from Arbitrage.CurveValue where CurveID = 2 
) 
merge t t using s s on t.CurveID = s.CurveID and t.Timepoint = s.Timepoint 
when not matched by target then insert (CurveID, Timepoint, Value) values (s.CurveID, s.Timepoint, s.Value) 
when not matched by source then delete 
when matched and t.Value <> s.Value or (t.Value is null and s.Value is not null) or (t.Value is not null and s.Value is null) then update set t.Value = s.Value
option (maxrecursion 0); 

--Item sample set 
;with s as 
(
	select 1 ID, 'DJI Mavic Air 2 Drone mit einer 4K Videokamera' Label
) 
merge Arbitrage.Item t using s s on t.ID = s.ID 
when not matched by target then insert (ID, Label) values (s.ID, s.Label) 
when matched and t.Label <> s.Label or (t.Label is not null and s.Label is null) or (t.Label is null and s.Label is not null) then update set t.Label = s.Label 
when not matched by source then delete; 

--ItemPriceCurve
;with s as 
(
	select 1 ItemID, 2 CurveID, 1 PriceSourceID
) 
merge Arbitrage.ItemPriceCurve t using s s on t.ItemID = s.ItemID and t.CurveID = s.CurveID and t.PriceSourceID = s.PriceSourceID 
when not matched by target then insert (ItemID, CurveID, PriceSourceID) values (s.ItemID, s.CurveID, s.PriceSourceID) 
when not matched by source then delete;