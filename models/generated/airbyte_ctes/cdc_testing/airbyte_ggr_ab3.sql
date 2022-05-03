{{ config(
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_cdc_testing",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('airbyte_ggr_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        'gid',
        'geom',
        'naam',
        'oidn',
        'uidn',
        'numac',
        'ggrnaa',
        'terrid',
        'niscode',
        'objectid',
        'datpublbs',
        'versdatum',
        'shape_area',
        'shape_leng',
        '_ab_cdc_lsn',
        '_ab_cdc_deleted_at',
        '_ab_cdc_updated_at',
    ]) }} as _airbyte_airbyte_ggr_hashid,
    tmp.*
from {{ ref('airbyte_ggr_ab2') }} tmp
-- airbyte_ggr
where 1 = 1

