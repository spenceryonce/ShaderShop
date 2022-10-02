import { initializeApp } from "./node_modules/firebase/app";
import { getAnalytics } from "./node_modules/firebase/analytics";

const firebaseConfig = {
apiKey: "AIzaSyAXaAMpnXtfXlkTtQNRsg8vYYWW-wou95w",
authDomain: "shadershop-8ed0f.firebaseapp.com",
projectId: "shadershop-8ed0f",
storageBucket: "shadershop-8ed0f.appspot.com",
messagingSenderId: "829583796254",
appId: "1:829583796254:web:bca43862a41238bedf260f",
measurementId: "G-6YDD01GG4C"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);