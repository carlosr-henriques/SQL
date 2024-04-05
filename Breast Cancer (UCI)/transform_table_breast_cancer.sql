CREATE TABLE breast_cancer.TBL_DADOS2
AS
SELECT
	CASE
		WHEN chr_nm_classe = 'no-recurrence-events' THEN 0
        WHEN chr_nm_classe = 'recurrence-events' THEN 1
	END AS chr_nm_classe,
    chr_nr_age,
    chr_cd_menopause,
    CASE
		WHEN chr_nr_tumor_size = '0-4' OR  chr_nr_tumor_size = '5-9' THEN 'Muito pequeno'
        WHEN chr_nr_tumor_size = '10-14' OR  chr_nr_tumor_size = '15-19' THEN 'Pequeno'
        WHEN chr_nr_tumor_size = '20-24' OR  chr_nr_tumor_size = '25-29' THEN 'Médio'
        WHEN chr_nr_tumor_size = '30-34' OR  chr_nr_tumor_size = '35-39' THEN 'Grande'
        WHEN chr_nr_tumor_size = '40-44' OR  chr_nr_tumor_size = '45-49' THEN 'Muito grande'
        WHEN chr_nr_tumor_size = '50-54' THEN 'Tratamento urgente'
	END chr_nr_tumor_size,
    chr_nr_inv_nodes,
    CASE
		WHEN chr_cd_node_caps = 'no' THEN 0
        WHEN chr_cd_node_caps = 'yes' THEN 1
		ELSE 2
	END chr_cd_node_caps,
    int_deg_malig,
    CASE
		WHEN chr_breast = 'left' THEN 'E'
        WHEN chr_breast = 'right' THEN 'D'
	END chr_breast,
    CASE
		WHEN chr_breast_quad = 'left_low' THEN 1
        WHEN chr_breast_quad = 'right_up' THEN 2
        WHEN chr_breast_quad = 'left_up' THEN 3
        WHEN chr_breast_quad = 'right_low' THEN 4
        WHEN chr_breast_quad = 'central' THEN 5
        ELSE 0
	END chr_breast_quad,
    CASE
		WHEN chr_cd_irradiat = 'no' THEN 0
        WHEN chr_cd_irradiat = 'yes' THEN 1
	END AS chr_cd_irradiat
FROM breast_cancer.TBL_DADOS;