                                         Table "public.line_items"
      Column       |            Type             |                        Modifiers                        
-------------------+-----------------------------+---------------------------------------------------------
 id                | integer                     | not null default nextval('line_items_id_seq'::regclass)
 order_id          | integer                     | 
 product_id        | integer                     | 
 quantity          | integer                     | 
 item_price_cents  | integer                     | 
 total_price_cents | integer                     | 
 created_at        | timestamp without time zone | not null
 updated_at        | timestamp without time zone | not null
Indexes:
    "line_items_pkey" PRIMARY KEY, btree (id)
    "index_line_items_on_order_id" btree (order_id)
    "index_line_items_on_product_id" btree (product_id)
Foreign-key constraints:
    "fk_rails_11e15d5c6b" FOREIGN KEY (product_id) REFERENCES products(id)
    "fk_rails_2dc2e5c22c" FOREIGN KEY (order_id) REFERENCES orders(id)

