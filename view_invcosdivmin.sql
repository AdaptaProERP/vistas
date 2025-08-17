SELECT     
MOV_CODSUC                       AS CDX_CODSUC,                      
 MOV_CODCTA                      AS CDX_CODPRO,                        
 MOV_CODIGO                      AS CDX_CODIGO,                        
 MIN(CONCAT(MOV_FECHA,MOV_HORA)) AS CDX_FCHHOR,              
 MIN(MOV_FECHA)                  AS CDX_FECHA,                        
 MOV_COSTO                       AS CDX_COSTO,                         
 MIN(MOV_COSTO/HMN_VALOR)         AS CDX_COSDIV,                        
(MOV_CANTID * MOV_CONTAB * ( MOV_COSTO * IF(MOV_CONTAB=1, (100-MOV_DESCUE)/100 , 1 ))) AS CDX_TOTAL ,                         
 HMN_VALOR                       AS CDX_VALDIV                        
 FROM DPMOVINV                          
 INNER JOIN DPHISMON ON HMN_CODIGO="USD" AND HMN_FECHA=MOV_FECHA                          
 WHERE MOV_APLORG="C" AND MOV_INVACT=1  AND MOV_CONTAB=1 AND HMN_VALOR>0                        
 GROUP BY MOV_CODSUC,MOV_CODCTA,MOV_CODIGO                        
 ORDER BY MOV_CODSUC,MOV_CODCTA,MOV_CODIGO,MOV_COSTO/HMN_VALOR                   
 DESC
