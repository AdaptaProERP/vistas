SELECT                   
MOV_CODSUC AS RVT_CODSUC,                  
MOV_TIPDOC AS RVT_TIPDOC,                  
MOV_DOCUME AS RVT_DOCUME,                  
SUM(MOV_CANTID) AS RVT_CANTID,        
SUM(MOV_TOTAL)  AS RVT_TOTAL,      
COUNT(*) AS RTV_COUNT      
FROM                   
DPMOVINV                  
WHERE                  
MOV_APLORG="V" AND MOV_INVACT=1        
GROUP BY MOV_CODSUC,MOV_TIPDOC,MOV_DOCUME                 
ORDER BY MOV_CODSUC,MOV_TIPDOC,MOV_DOCUME
