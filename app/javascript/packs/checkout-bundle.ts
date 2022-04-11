import ReactOnRails from "react-on-rails";

import Checkout from "../bundles/Checkout/components/HelloWorld";

// This is how react_on_rails can see the Checkout in the browser.
ReactOnRails.register({
    Checkout,
});
