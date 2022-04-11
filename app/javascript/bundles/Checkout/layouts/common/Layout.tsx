import * as React from "react";
import Header from "../../components/header/Header";
import Footer from "../../components/footer/Footer";

// @ts-ignore
import style from "./Layout.module.css";

interface IProps {
    children?: React.ReactNode;
}

const Layout = ({ children }: IProps) => {
    return (
        <>
            <Header />
            <div className={style.content}>{children}</div>
            <Footer />
        </>
    );
};

export default Layout;
