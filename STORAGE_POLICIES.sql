-- Run this in Supabase SQL Editor after creating the public bucket named product-images.
-- This allows only users registered in public.admin_users to upload, update, or delete images.

create policy "Admins can upload product images"
on storage.objects
for insert
 to authenticated
with check (
  bucket_id = 'product-images'
  and exists (select 1 from public.admin_users where user_id = auth.uid())
);

create policy "Admins can update product images"
on storage.objects
for update
 to authenticated
using (
  bucket_id = 'product-images'
  and exists (select 1 from public.admin_users where user_id = auth.uid())
)
with check (
  bucket_id = 'product-images'
  and exists (select 1 from public.admin_users where user_id = auth.uid())
);

create policy "Admins can delete product images"
on storage.objects
for delete
 to authenticated
using (
  bucket_id = 'product-images'
  and exists (select 1 from public.admin_users where user_id = auth.uid())
);
