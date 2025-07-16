'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "1ec4326c89b7f726a51e9c6b14d63a31",
"version.json": "27d73a57d8790926563ab62ff32cb1ea",
"index.html": "9a70b03069eaacdee1c6adcd9eb79eba",
"/": "9a70b03069eaacdee1c6adcd9eb79eba",
"main.dart.js": "e99874b9a476e2b2c30569caecd1ef73",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"favicon.png": "e4614a67957b5141cd11583e139407ad",
"icons/Icon-192.png": "94939596324c48725ab5167ded61489d",
"icons/Icon-maskable-192.png": "94939596324c48725ab5167ded61489d",
"icons/Icon-maskable-512.png": "8e2a166cdeff64a6ac9eb6ed7f7dc8b1",
"icons/Icon-512.png": "8e2a166cdeff64a6ac9eb6ed7f7dc8b1",
"manifest.json": "a2ffccffa56bfac5ae98ae08b5e9aed5",
"assets/AssetManifest.json": "ef5e59cfa78bc470a3647e8989613581",
"assets/NOTICES": "8edbb931715a8e85aceb12b5c9799110",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/AssetManifest.bin.json": "9b670504ff728ea7f3e10cb2bc9f525f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "b93248a553f9e8bc17f1065929d5934b",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "a2eb084b706ab40c90610942d98886ec",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "4769f3245a24c1fa9965f113ea85ec2a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "b765b1ee278c78f979654bb8e9446ee1",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/assets/pics/consultant2_min.png": "b9f902b0f6c681f41d5f6fa8d7116757",
"assets/assets/pics/consultant1_min.png": "866726e148e6eb4712ea71ba8066fc27",
"assets/assets/pics/contact3_min.png": "a1670bfe58e86cebf1718f651ab666fa",
"assets/assets/pics/contact2_min.png": "ce61db1a45fef08c8fc34a6e61cca914",
"assets/assets/pics/about1.png": "dc00324dc0c596d6d39ceccb4ab39913",
"assets/assets/pics/pic.png": "af60b5088b9562d10b9dcbc6ed662d6d",
"assets/assets/pics/contact1_min.png": "5f927c2e229d5053734c0c939d22854a",
"assets/assets/logo/flutter_logo.png": "d0515092173211776ceed19b39c2a041",
"assets/assets/logo/ci_cd_logo.png": "82aa28639e7c03ca7082a900e61d201d",
"assets/assets/logo/docker_logo.png": "4aa9594c59eddf138ae1d0f3d65ffef8",
"assets/assets/logo/javascript_logo.png": "bf42f3a398d21181935361dcb36de1b7",
"assets/assets/logo/kobo_logo.png": "631297959fde30e351a307650fe4eb99",
"assets/assets/logo/bled_logo512.png": "d3a8f31423ff5a8cf9ec6db8b9b461ee",
"assets/assets/logo/react_logo.png": "4b38b7a5b8b9aff2b65dda2888147e3b",
"assets/assets/logo/node_logo.png": "4b21635dbac6dbe6a12e8a5416c6d216",
"assets/assets/logo/IMG_1859.png": "1e358e35aa34190f07da6b90db73ce4a",
"assets/assets/logo/512_white_bk_inverted.png": "e9ee7ebdeee12ac1c3b4d568eab18d79",
"assets/assets/logo/html_logo.png": "3b8836ece7056ad4670b29038d9f3d77",
"assets/assets/logo/bk_logo.png": "5bbb443a22b65392a0c01eb71c9f712c",
"assets/assets/logo/github_logo.png": "aafa237b9fa15efeea2bf957e311f179",
"assets/assets/logo/sql_server_logo.png": "b95fb4d7afc77a1b417e18d85a28685c",
"assets/assets/logo/css_logo.png": "b408354a44cd0ce59d9b8b6ba04c193c",
"assets/assets/logo/siikaa_icon_logo.png": "74bda9aa5c1d9f467eec592d985e0dd2",
"assets/assets/logo/firebase_logo.png": "0e8789d152ed2744d7f7265dc3f1457e",
"assets/assets/logo/python_logo.png": "ee9ccbc810be685de2cf3cb11f62ff98",
"assets/assets/logo/instagram_logo.png": "da3e4fda686612ac5ecd11bf341f64e7",
"assets/assets/logo/gmail_logo.png": "7f1d37c86aa8f6979747a62ca263c759",
"assets/assets/logo/mysql_logo.png": "8c021343c59d3c5f679bdd7dfc48a374",
"assets/assets/logo/300_white_bk.png": "9e027915592e36801f12c08de282ff3d",
"assets/assets/logo/linkedin_logo.png": "596eb5ed0c92d09350e3d199609bf6de",
"assets/assets/logo/php_logo.png": "78ecbc6466fa866b4d05553784115bec",
"assets/assets/logo/128_siikaa.png": "62e3231b37c9a36b542ec1fe887a0624",
"assets/assets/logo/java_logo.png": "7c468ec800504e8ef613cfa80bb18d7b",
"assets/assets/logo/sqlite_logo.png": "81536419a34a1b52ca6829d38e947320",
"assets/assets/logo/512_white_bk.png": "e8c8974478aa203349a5568302b37dd9",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
