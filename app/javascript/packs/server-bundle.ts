import ReactOnRails from "react-on-rails";

import CheckoutContainer from "../bundles/Checkout/containers";

// This is how react_on_rails can see the Checkout in the browser.
ReactOnRails.register({
    Checkout: CheckoutContainer,
});
