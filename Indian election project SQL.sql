SELECT distinct count('Parliament Constituency')AS Total_seats
from constituencywise_results;

select
s.State as state_name,
count(cr.Parliament_Constituency) as Total_seats
from constituencywise_results cr
inner join statewise_results sr on cr.Parliament_Constituency = sr.Parliament_Constituency
inner join states s on sr.State_ID = s.State_ID
group by s.State;

SELECT sum(case WHEN party IN ('Bharatiya Janata Party - BJP',
                       'Telugu Desam - TDP',
                       'Janata Dal  (United) - JD(U)',
                       'Shiv Sena - SHS',
                       'AJSU Party - AJSUP',
                       'Apna Dal (Soneylal) - ADAL',
                       'Asom Gana Parishad - AGP',
                       'Hindustani Awam Morcha (Secular) - HAMS',
                       'Janasena Party - JnP',
                       'Janata Dal  (Secular) - JD(S)',
                       'Lok Janshakti Party(Ram Vilas) - LJPRV',
                       'Nationalist Congress Party - NCP',
                       'Rashtriya Lok Dal - RLD',
                       'Sikkim Krantikari Morcha - SKM')
                       THEN Won
                    else 0
                   END) AS NDA_Total_Seats_Won
from  partywise_results;
					                  
                    
select party as party_name,Won as seats_Won
from partywise_results
where party in('Bharatiya Janata Party - BJP',
                       'Telugu Desam - TDP',
                       'Janata Dal  (United) - JD(U)',
                       'Shiv Sena - SHS',
                       'AJSU Party - AJSUP',
                       'Apna Dal (Soneylal) - ADAL',
                       'Asom Gana Parishad - AGP',
                       'Hindustani Awam Morcha (Secular) - HAMS',
                       'Janasena Party - JnP',
                       'Janata Dal  (Secular) - JD(S)',
                       'Lok Janshakti Party(Ram Vilas) - LJPRV',
                       'Nationalist Congress Party - NCP',
                       'Rashtriya Lok Dal - RLD',
                       'Sikkim Krantikari Morcha - SKM'
                )
 order by seats_Won  desc;          



-- Total seats won by I.N.D.I.A. Alliance
-- Indian National Developmentle Alliance

select sum(case when party in('Indian National Congress - INC',
							  'Aam Aadmi Party - AAAP',
                              'All India Trinamool Congress - AITC',
                              'Bharat Adivasi Party - BHRTADVSIP',
                              'Communist Party of India  (Marxist) - CPI(M)',
                              'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                              'Communist Party of India - CPI',
                              'Dravida Munnetra Kazhagam - DMK',
                              'Indian Union Muslim League - IUML',
                              'Jammu & Kashmir National Conference - JKN',
                              'Jharkhand Mukti Morcha - JMM',
                              'Kerala Congress - KEC',
                              'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                              'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                              'Rashtriya Janata Dal - RJD',
                              'Rashtriya Loktantrik Party - RLTP',
                              'Revolutionary Socialist Party - RSP',
                              'Samajwadi Party - SP',
                              'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                              'Viduthalai Chiruthaigal Katchi - VCK'
						)then Won 
					else 0 
				end) as Party_Won_Seats
from  partywise_results;                                   
                                                     
                              
          
--  seats won by I.N.D.I.A Alliance party
          


select party,Won
from  partywise_results
where party in('Indian National Congress - INC',
							  'Aam Aadmi Party - AAAP',
                              'All India Trinamool Congress - AITC',
                              'Bharat Adivasi Party - BHRTADVSIP',
                              'Communist Party of India  (Marxist) - CPI(M)',
                              'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                              'Communist Party of India - CPI',
                              'Dravida Munnetra Kazhagam - DMK',
                              'Indian Union Muslim League - IUML',
                              'Jammu & Kashmir National Conference - JKN',
                              'Jharkhand Mukti Morcha - JMM',
                              'Kerala Congress - KEC',
                              'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                              'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                              'Rashtriya Janata Dal - RJD',
                              'Rashtriya Loktantrik Party - RLTP',
                              'Revolutionary Socialist Party - RSP',
                              'Samajwadi Party - SP',
                              'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                              'Viduthalai Chiruthaigal Katchi - VCK')
order by Won desc;     


-- Add New Column Field in the partywise_results to get the party Alliance as NDA,I.N.D.I.A and other       

ALTER TABLE partywise_results
add party_alliance varchar(50);


update partywise_results
set party_alliance = 'I.N.D.I.A'
WHERE party in('Indian National Congress - INC',
							  'Aam Aadmi Party - AAAP',
                              'All India Trinamool Congress - AITC',
                              'Bharat Adivasi Party - BHRTADVSIP',
                              'Communist Party of India  (Marxist) - CPI(M)',
                              'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                              'Communist Party of India - CPI',
                              'Dravida Munnetra Kazhagam - DMK',
                              'Indian Union Muslim League - IUML',
                              'Jammu & Kashmir National Conference - JKN',
                              'Jharkhand Mukti Morcha - JMM',
                              'Kerala Congress - KEC',
                              'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                              'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                              'Rashtriya Janata Dal - RJD',
                              'Rashtriya Loktantrik Party - RLTP',
                              'Revolutionary Socialist Party - RSP',
                              'Samajwadi Party - SP',
                              'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                              'Viduthalai Chiruthaigal Katchi - VCK'
                           );   




update partywise_results
set party_alliance = 'NDA'
WHERE party in('Bharatiya Janata Party - BJP',
                       'Telugu Desam - TDP',
                       'Janata Dal  (United) - JD(U)',
                       'Shiv Sena - SHS',
                       'AJSU Party - AJSUP',
                       'Apna Dal (Soneylal) - ADAL',
                       'Asom Gana Parishad - AGP',
                       'Hindustani Awam Morcha (Secular) - HAMS',
                       'Janasena Party - JnP',
                       'Janata Dal  (Secular) - JD(S)',
                       'Lok Janshakti Party(Ram Vilas) - LJPRV',
                       'Nationalist Congress Party - NCP',
                       'Rashtriya Lok Dal - RLD',
                       'Sikkim Krantikari Morcha - SKM'
                           );                     
                           
                           
update partywise_results
set party_alliance = 'other'
where party_alliance is null;



select party_alliance,sum(Won)
from partywise_results
group by party_alliance;   


select party,Won
from partywise_results
where party_alliance='I.N.D.I.A'
order by Won DESC;

-- Winning candidate's name,their party name,total votes, and the margin of victory for a specific state and contituency?

SELECT 
cr.Winning_Candidate,
pr.party,
cr.Total_Votes,
cr.Margin,
s.State,
cr.Constituency_Name
from constituencywise_results cr
inner join partywise_results pr on pr.Party_ID = cr.Party_ID
inner join statewise_results sr  on sr.Parliament_Constituency = cr.Parliament_Constituency
inner join states s on s.State_ID = sr.State_ID
where cr.Constituency_Name ='AGRA';

-- What is the Distribution of EVM votes versus postal votes for candidates in a specific constituency?

SELECT
cd.EVM_Votes,
cd.Postal_Votes,
cd.Total_Votes,
cd.Candidate,
cr.Constituency_Name
from constituencywise_results cr join constituencywise_details cd 
on cr.Constituency_ID = cd.Constituency_ID
where cr.Constituency_Name="ARANI";

-- Which party Won the most seats in a state,and how many seats did each party win?

SELECT pr.party,count(cr.Constituency_Name)as seats_won
from partywise_results pr
inner join constituencywise_results cr on cr.Party_ID = pr.Party_ID
inner join statewise_results sr on sr.Parliament_Constituency = cr.Parliament_Constituency
where sr.State = 'Gujarat'
group by pr.party;


-- What is the total number of seats won by each party alliance (NDA, I.N.D.I.A, and OTHER) in each state for the India Elections 2024

select 
s.State,
sum(case when pr.party_alliance = 'NDA' then 1 else 0 end) as NDA_seats_won,
sum(case when pr.party_alliance = 'I.N.D.I.A' THEN 1 ELSE 0 END) as INDIA_seats_won,
SUM(case when pr.party_alliance = 'other' then 1 else 0 end) as other_seats_won
from constituencywise_results cr
inner join partywise_results pr on  cr.Party_ID = pr.Party_ID
inner join statewise_results sr on sr.Parliament_Constituency = cr.Parliament_Constituency
inner join states s on sr.State_ID = s.State_ID
group by s.State;


-- Which candidate received the highest number of EVM votes in each constituency (Top 10)?

select
cr.Constituency_Name,    
cd.Constituency_ID,
cd.Candidate,
cd.EVM_Votes
from constituencywise_details cd
inner join constituencywise_results cr on cr.Constituency_ID = cd.Constituency_ID
where cd.EVM_Votes =(select max(cd1.EVM_Votes) from constituencywise_details cd1 where cd1.Constituency_ID = cd.Constituency_ID)
order by cd.EVM_Votes desc limit 10;


-- Which candidate won and which candidate was the runner-up in each constituency of State for the 2024 elections?

WITH RankedCandidates AS (
    SELECT 
        cd.Constituency_ID,
        cd.Candidate,
        cd.Party,
        cd.EVM_Votes,
        cd.Postal_Votes,
        cd.EVM_Votes + cd.Postal_Votes AS Total_Votes,
        ROW_NUMBER() OVER (PARTITION BY cd.Constituency_ID ORDER BY cd.EVM_Votes + cd.Postal_Votes DESC) AS VoteRank
    FROM 
        constituencywise_details cd
    JOIN 
        constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
    JOIN 
        statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
    JOIN 
        states s ON sr.State_ID = s.State_ID
    WHERE 
        s.State = 'Maharashtra'
)

SELECT 
    cr.Constituency_Name,
    MAX(CASE WHEN rc.VoteRank = 1 THEN rc.Candidate END) AS Winning_Candidate,
    MAX(CASE WHEN rc.VoteRank = 2 THEN rc.Candidate END) AS Runnerup_Candidate
FROM 
    RankedCandidates rc
JOIN 
    constituencywise_results cr ON rc.Constituency_ID = cr.Constituency_ID
GROUP BY 
    cr.Constituency_Name
ORDER BY 
    cr.Constituency_Name;







