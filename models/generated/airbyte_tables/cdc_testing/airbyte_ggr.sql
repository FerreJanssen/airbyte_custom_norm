{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "cdc_testing",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('airbyte_ggr_ab3') }}
select
    gid,
    geom,
    naam,
    oidn,
    uidn,
    numac,
    ggrnaa,
    terrid,
    niscode,
    objectid,
    datpublbs,
    versdatum,
    shape_area,
    shape_leng,
    _ab_cdc_lsn,
    _ab_cdc_deleted_at,
    _ab_cdc_updated_at,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_airbyte_ggr_hashid
from {{ ref('airbyte_ggr_ab3') }}
-- airbyte_ggr from {{ source('cdc_testing', '_airbyte_raw_airbyte_ggr') }}
where 1 = 1

