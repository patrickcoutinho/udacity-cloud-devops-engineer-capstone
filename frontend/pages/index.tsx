import Head from "next/head";
import Header from "../components/header/header";
import Main from "../components/main/main";

const content = (
  <div className="border-4 border-dashed border-gray-200 rounded-lg h-96" />
);

export default function Home() {
  return (
    <div>
      <Head>
        <title>Frontend</title>
        <meta
          name="description"
          content="Frontend | Udacity Cloud DevOps Engineer Capstone"
        />
      </Head>
      <header>
        <Header />
      </header>

      <main>
        <Main title="Accounts" content={content} />
      </main>
    </div>
  );
}
