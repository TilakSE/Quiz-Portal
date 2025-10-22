<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* Basic reset */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      font-family: Arial, sans-serif;
    }

    .content {
      flex: 1; /* pushes footer down if content is small */
      padding: 20px;
    }

    footer {
      background-color: royalblue;
      color: white;
      text-align: center;
      padding: 15px 0;
      width: 100%;
      transition: position 0.3s ease;
    }
</style>

</head>
<body>

<footer class="site-footer">
  &copy; 2025 S E Tilak QuizPortal | All Rights Reserved
</footer>

<script>
    const footer = document.querySelector('footer');

    function adjustFooterPosition() {
      const bodyHeight = document.body.scrollHeight;
      const viewportHeight = window.innerHeight;

      if (bodyHeight <= viewportHeight) {
        // Page shorter than screen — fix footer to bottom
        footer.style.position = 'fixed';
        footer.style.bottom = '0';
        footer.style.left = '0';
      } else {
        // Page longer — make footer flow normally
        footer.style.position = 'relative';
      }
    }

    window.addEventListener('load', adjustFooterPosition);
    window.addEventListener('resize', adjustFooterPosition);
</script>
</body>
</html>