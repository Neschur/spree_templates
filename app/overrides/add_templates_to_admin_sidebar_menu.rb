Deface::Override.new(
  virtual_path: 'spree/layouts/admin',
  name: 'templates_admin_sidebar_menu',
  insert_bottom: '#main-sidebar',
  partial: 'spree/admin/shared/templates_sidebar_menu'
)
