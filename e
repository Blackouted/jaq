<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ultraviolet Proxy</title>
    <style>
        body { font-family: sans-serif; display: flex; flex-direction: column; align-items: center; }
        #urlInput { width: 80%; padding: 10px; margin-bottom: 10px; }
        #searchButton { padding: 10px 20px; }
        #iframeWindow { width: 90%; height: 600px; border: 1px solid #ccc; margin-top: 20px; }
    </style>
</head>
<body>
    <h1>Ultraviolet Proxy</h1>
    <input type="text" id="urlInput" placeholder="Enter URL here">
    <button id="searchButton">Go</button>
    <iframe id="iframeWindow"></iframe>

    <script src="/uv/uv.bundle.js"></script>
    <script src="/uv/uv.config.js"></script>
    <script src="/uv/uv.sw-handler.js"></script>
    <script>
        // Register the Ultraviolet service worker
        if ('serviceWorker' in navigator) {
            navigator.serviceWorker.register('/uv/sw.js');
        }

        const urlInput = document.getElementById('urlInput');
        const searchButton = document.getElementById('searchButton');
        const iframeWindow = document.getElementById('iframeWindow');

        searchButton.addEventListener('click', loadUrl);
        urlInput.addEventListener('keydown', (event) => {
            if (event.key === 'Enter') {
                loadUrl();
            }
        });

        function loadUrl() {
            const url = urlInput.value;
            if (url) {
                // Encode the URL using Ultraviolet's codec and set it as the iframe's source
                iframeWindow.src = __uv$config.prefix + __uv$config.encodeUrl(url);
            }
        }
    </script>
</body>
</html>
