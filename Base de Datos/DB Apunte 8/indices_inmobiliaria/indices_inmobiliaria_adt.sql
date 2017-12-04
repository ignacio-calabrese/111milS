CREATE INDEX id_propiedad ON property(property_type_id); 
CREATE INDEX id_region ON property(region_id); 
CREATE INDEX dni_vendedor ON property(seller_dni); 
            
//Justificaciòn: Los 3 atributos son claves externas

