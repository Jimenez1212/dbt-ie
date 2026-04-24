select
    product_id,
    product_name,
    category_id,
    supplier_id,
    price,
    cost,
    description,
    sku,
    barcode,
    status,
    created_date,
    is_featured
from{{source('raw', 'products')}}