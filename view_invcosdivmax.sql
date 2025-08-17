SELECT       
MOV_CODSUC                      AS CDY_CODSUC,                    
MOV_CODCTA                      AS CDY_CODPRO,                        
MOV_CODIGO                      AS CDY_CODIGO,                        
MAX(CONCAT(MOV_FECHA,MOV_HORA)) AS CDY_FCHHOR,                
MAX(MOV_FECHA)                  AS CDY_FECHA,                        
MOV_COSTO                       AS CDY_COSTO,                         
MAX(MOV_COSTO/HMN_VALOR)        AS CDY_COSDIV,                        
(MOV_CANTID * MOV_CONTAB * ( MOV_COSTO * IF(MOV_CONTAB=1, (100-MOV_DESCUE)/100 , 1 ))) AS CDY_TOTAL ,                         
HMN_VALOR                       AS CDY_VALDIV                        
FROM DPMOVINV                          
INNER JOIN DPHISMON ON HMN_CODIGO="USD" AND HMN_FECHA=MOV_FECHA                          
WHERE MOV_APLORG="C" AND MOV_INVACT=1  AND MOV_CONTAB=1 AND HMN_VALOR>0                        
GROUP BY MOV_CODSUC,MOV_CODCTA,MOV_CODIGO                        
ORDER BY MOV_CODSUC,MOV_CODCTA,MOV_CODIGO,MOV_COSTO/HMN_VALOR
