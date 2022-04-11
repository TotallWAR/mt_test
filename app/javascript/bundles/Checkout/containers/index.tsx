import * as React from "react";
import Layout from "../layouts/common/Layout";
import ItemsPicker from "../components/items-picker/ItemsPicker";
import BasketInfo from "../components/basket-info/BasketInfo";
import { ItemsProvider } from "../context/items.context";

import "../../common/styles/index.css";

const CheckoutContainer = () => {
    return (
        <ItemsProvider>
            <Layout>
                <ItemsPicker />
                <BasketInfo />
            </Layout>
        </ItemsProvider>
    );
};

export default CheckoutContainer;
