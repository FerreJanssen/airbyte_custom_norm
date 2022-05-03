{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_cdc_testing",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('airbyte_ggr_ab1') }}
select
    cast(gid as {{ dbt_utils.type_float() }}) as gid,
    cast(geom as {{ dbt_utils.type_string() }}) as geom,
    cast(naam as {{ dbt_utils.type_string() }}) as naam,
    cast(oidn as {{ dbt_utils.type_float() }}) as oidn,
    cast(uidn as {{ dbt_utils.type_float() }}) as uidn,
    cast(numac as {{ dbt_utils.type_string() }}) as numac,
    cast(ggrnaa as {{ dbt_utils.type_string() }}) as ggrnaa,
    cast(terrid as {{ dbt_utils.type_float() }}) as terrid,
    cast(niscode as {{ dbt_utils.type_float() }}) as niscode,
    cast(objectid as {{ dbt_utils.type_float() }}) as objectid,
    cast(datpublbs as {{ dbt_utils.type_string() }}) as datpublbs,
    cast(versdatum as {{ dbt_utils.type_string() }}) as versdatum,
    cast(shape_area as {{ dbt_utils.type_float() }}) as shape_area,
    cast(shape_leng as {{ dbt_utils.type_float() }}) as shape_leng,
    cast(_ab_cdc_lsn as {{ dbt_utils.type_float() }}) as _ab_cdc_lsn,
    cast(_ab_cdc_deleted_at as {{ dbt_utils.type_string() }}) as _ab_cdc_deleted_at,
    cast(_ab_cdc_updated_at as {{ dbt_utils.type_string() }}) as _ab_cdc_updated_at,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('airbyte_ggr_ab1') }}
-- airbyte_ggr
where 1 = 1

