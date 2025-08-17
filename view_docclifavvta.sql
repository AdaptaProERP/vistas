SELECT                                                 
DOC_CODSUC     AS PAG_CODSUC,                                                
DOC_TIPDOC     AS PAG_TIPDOC,                                                
DOC_NUMERO     AS PAG_NUMERO,                                                
DOC_CODIGO     AS PAG_CODIGO,                                                
DOC_CODVEN     AS PAG_CODVEN,                                            
DOC_CXC*-1     AS PAG_CXC,                                              
DOC_TIPTRA     AS PAG_TIPTRA,                                  
DOC_RECNUM     AS PAG_RECNUM,                                             
DOC_FECHA      AS PAG_FCHPAG,          
DOC_NETO       AS PAG_MONTO,      
DOC_MTOIVA     AS PAG_MTOIVA,  
DOC_BASNET     AS PAG_BASNET                                                                                    
FROM  DPDOCCLI                                                
WHERE (DOC_TIPDOC="FAV" OR DOC_TIPDOC="CRE" OR DOC_TIPDOC="DEV" OR DOC_TIPDOC="CHD")                    
     AND DOC_TIPTRA="P" AND DOC_ACT=1                                                
GROUP BY DOC_CODSUC,DOC_TIPDOC,DOC_NUMERO,DOC_RECNUM                                                 
ORDER BY DOC_CODSUC,DOC_FECHA
