// 巨大画像のアップロードを防止する
document.addEventListener("turbo:load", function() {
  document.addEventListener("change", function(event) {
    let image_upload = document.querySelector('#episode_image');
    if (image_upload){
      const size_in_megabytes = image_upload.files[0].size/1024/1024;
      if (size_in_megabytes > 5) {
        alert("ファイルサイズは5MBまでです。");
        image_upload.value = "";
      }
    }
  });
});