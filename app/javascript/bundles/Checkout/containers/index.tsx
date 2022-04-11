import * as React from "react";
import Layout from "../layouts/common/Layout";
import ItemsPicker from "../components/items-picker/ItemsPicker";

import "../../common/styles/index.css";

const CheckoutContainer = () => {
    return (
        <Layout>
            <ItemsPicker />
        </Layout>
    );
};

export default CheckoutContainer;
