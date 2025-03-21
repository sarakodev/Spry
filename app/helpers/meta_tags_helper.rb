module MetaTagsHelper
  def meta_title
    content_for?(:meta_title) ? content_for(:meta_title) : DEFAULT_META["meta_title"]
  end

  def meta_description
    content_for?(:meta_description) ? content_for(:meta_description) : DEFAULT_META["meta_description"]
  end

  def meta_image
    meta_image = (content_for?(:meta_image) ? content_for(:meta_image) : DEFAULT_META["meta_image"])
    # Vérifie si l’image commence par "http" (c'est déjà une URL complète) ou si c’est un asset local
    meta_image.starts_with?("http") ? meta_image : image_url(meta_image)
  end
end
