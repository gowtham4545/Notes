# Progressive Web Apps ( PWA )

<pre>
A progressive web application (PWA), or progressive web app, is a type of application software delivered through the web, built using common web technologies including HTML, CSS, JavaScript, and WebAssembly. It is intended to work on any platform with a standards-compliant browser, including desktop and mobile devices.
</pre>

## Installation

```bash
# for reactjs in javascript
npx create-react-app my-app --template cra-template-pwa
# for reactjs in typescript
npx create-react-app my-app --template cra-template-pwa-typescript
```
#### serve package converts our current working directory into an virtual directory i.e. the directory is hosted under localhost

```bash
npm install serve
```

## Analysing PWA

+ **Lighthouse**
    <pre>
    An extension tool that is designed by Google, for the analysis of PWAs
    </pre>
    [Link](https://developer.chrome.com/docs/lighthouse/pwa/load-fast-enough-for-pwa)

+ **Register Service worker**
  
  <pre>
  Service workers are JavaScript files that run in the background and enable features like offline functionality 
  and push notifications. Create a service worker file, such as service-worker.js, in the public directory.
  </pre>
  
  ```js
    ''' index.js '''
    import * as serviceWorkerRegistration from './serviceWorkerRegistration';

    // If you want your app to work offline and load faster, you can change
    // unregister() to register() below. Note this comes with some pitfalls.
    // Learn more about service workers: https://cra.link/PWA
    serviceWorkerRegistration.unregister();
  ```

+ **Going Offline**
  
  <pre>
  With the service worker in place, your PWA can now cache assets and work offline. When users visit your PWA, 
  the service worker will cache resources, allowing them to access your app even when they’re not connected to 
  the internet.
  </pre>
  
+ **HTTPS Enabling**
  
  <pre>
  PWAs must be served over HTTPS for security reasons. You can obtain a free SSL certificate from Let’s Encrypt or 
  use a hosting service that provides SSL certificates by default.
  </pre>
  
+ **Enabling Push Notifications**
    
    <pre>
    <p>To enable push notifications, you’ll need to use a service like Firebase Cloud Messaging (FCM) or OneSignal. <br>These services provide the infrastructure for sending and receiving push notifications in your PWA.</p>
    <p>Integrate the service of your choice into your React app and follow their documentation to enable push notifications.</p>
    </pre>
    
+ **Manifest.json**
    <pre>
    The web app manifest is a JSON file that provides information about your PWA.
   - Adding Name, description
   - Images and icons for different resolution
    </pre>
+ **Installing...**
  <pre>
   - Adding to Chrome
   - If mobile: Add to HomeScreen -> Install. 
  </pre>
  

## References
- [Mozilla](https://developer.mozilla.org/en-US/docs/Web/Progressive_web_apps)
- [Google](https://web.dev/explore/progressive-web-apps)
- [Web Dev Tutorials](https://web.dev/learn/pwa/)