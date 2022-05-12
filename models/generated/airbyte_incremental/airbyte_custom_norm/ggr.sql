{{ config(
    unique_key = "_airbyte_unique_key",
    schema = "airbyte_custom_norm",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('ggr_scd') }}
select
    _airbyte_unique_key,
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
    _airbyte_ggr_hashid
from {{ ref('ggr_scd') }}
-- ggr from {{ source('airbyte_custom_norm', '_airbyte_raw_ggr') }}
where 1 = 1
and _airbyte_active_row = 1
{{ incremental_clause('_airbyte_emitted_at') }}

