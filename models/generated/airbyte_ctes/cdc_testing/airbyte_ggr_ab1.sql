{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_cdc_testing",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ source('cdc_testing', '_airbyte_raw_airbyte_ggr') }}
select
    {{ json_extract_scalar('_airbyte_data', ['gid'], ['gid']) }} as gid,
    {{ json_extract_scalar('_airbyte_data', ['geom'], ['geom']) }} as geom,
    {{ json_extract_scalar('_airbyte_data', ['naam'], ['naam']) }} as naam,
    {{ json_extract_scalar('_airbyte_data', ['oidn'], ['oidn']) }} as oidn,
    {{ json_extract_scalar('_airbyte_data', ['uidn'], ['uidn']) }} as uidn,
    {{ json_extract_scalar('_airbyte_data', ['numac'], ['numac']) }} as numac,
    {{ json_extract_scalar('_airbyte_data', ['ggrnaa'], ['ggrnaa']) }} as ggrnaa,
    {{ json_extract_scalar('_airbyte_data', ['terrid'], ['terrid']) }} as terrid,
    {{ json_extract_scalar('_airbyte_data', ['niscode'], ['niscode']) }} as niscode,
    {{ json_extract_scalar('_airbyte_data', ['objectid'], ['objectid']) }} as objectid,
    {{ json_extract_scalar('_airbyte_data', ['datpublbs'], ['datpublbs']) }} as datpublbs,
    {{ json_extract_scalar('_airbyte_data', ['versdatum'], ['versdatum']) }} as versdatum,
    {{ json_extract_scalar('_airbyte_data', ['shape_area'], ['shape_area']) }} as shape_area,
    {{ json_extract_scalar('_airbyte_data', ['shape_leng'], ['shape_leng']) }} as shape_leng,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_lsn'], ['_ab_cdc_lsn']) }} as _ab_cdc_lsn,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_deleted_at'], ['_ab_cdc_deleted_at']) }} as _ab_cdc_deleted_at,
    {{ json_extract_scalar('_airbyte_data', ['_ab_cdc_updated_at'], ['_ab_cdc_updated_at']) }} as _ab_cdc_updated_at,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ source('cdc_testing', '_airbyte_raw_airbyte_ggr') }} as table_alias
-- airbyte_ggr
where 1 = 1

