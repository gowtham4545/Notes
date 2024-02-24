# Progressive Web Apps ( PWA )

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
    ```
    An extension tool that is designed by Google, for the analysis of PWAs
    ```
    [Link](https://developer.chrome.com/docs/lighthouse/pwa/load-fast-enough-for-pwa)

+ **Register Service worker**
  
  ```
  Service workers are JavaScript files that run in the background and enable features like offline functionality and push notifications. Create a service worker file, such as service-worker.js, in the public directory.
  ```
  
  ```js
    ''' index.js '''
    import * as serviceWorkerRegistration from './serviceWorkerRegistration';

    // If you want your app to work offline and load faster, you can change
    // unregister() to register() below. Note this comes with some pitfalls.
    // Learn more about service workers: https://cra.link/PWA
    serviceWorkerRegistration.unregister();
  ```

+ **Going Offline**
  
  ```
  With the service worker in place, your PWA can now cache assets and work offline. When users visit your PWA, the service worker will cache resources, allowing them to access your app even when they’re not connected to the internet.
  ```
  
+ **HTTPS Enabling**
  
  ```
  PWAs must be served over HTTPS for security reasons. You can obtain a free SSL certificate from Let’s Encrypt or use a hosting service that provides SSL certificates by default.
  ```
  
+ **Enabling Push Notifications**
    
    ```
    To enable push notifications, you’ll need to use a service like Firebase Cloud Messaging (FCM) or OneSignal. These services provide the infrastructure for sending and receiving push notifications in your PWA.

    Integrate the service of your choice into your React app and follow their documentation to enable push notifications.
    ```
    
+ **Manifest.json**
    ```
    The web app manifest is a JSON file that provides information about your PWA.
   - Adding Name, description
   - Images and icons for different resolution
    ```
+ **Installing...**
   - Adding to Chrome
   - If mobile: Add to HomeScreen -> Install. 
  

## References
- [Mozilla](https://developer.mozilla.org/en-US/docs/Web/Progressive_web_apps)
- [Google](https://web.dev/explore/progressive-web-apps)
- [Web Dev Tutorials](https://web.dev/learn/pwa/)