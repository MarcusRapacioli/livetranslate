import "bootstrap";

// import '../components/fullpage';
// fullPage();
// fullpage_api.setAllowScrolling(false);


// Profile tabs
import { openCity } from '../components/tabs';

const tabs = document.querySelectorAll('.tablinks')

tabs.forEach(tab => {
  tab.addEventListener('click', event => {
    openCity(event, event.target.dataset["city"])
  })
})
