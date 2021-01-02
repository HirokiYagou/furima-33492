if (document.URL.match( /items/ )) {
  document.addEventListener('DOMContentLoaded', () => {
    const thumbnailImgs = document.querySelectorAll('.thumbnail-img')

    thumbnailImgs.forEach((thumbnailImg) => {
      thumbnailImg.addEventListener('click', () => {
        const thumbnailSrc = thumbnailImg.getAttribute('src')
        const itemMainImage = document.getElementById('item-main-image')
        itemMainImage.removeAttribute('src')
        itemMainImage.setAttribute('src', thumbnailSrc)
      })
    });
  })
}