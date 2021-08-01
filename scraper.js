const puppeteer = require("puppeteer");

const run = async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();

  await page.goto("https://mhst.kiranico.com/mhs2/data/monsties");

  // Table that has all the other tables with the desired data
  const parentTable = await page.$x(
    "/html/body/div/div/div[2]/div[2]/div[1]/div/table/tbody"
  );

  console.log("Searching table 1");
  const tables = await parentTable[0].$$eval("tr", (rows) => {
    /**
     *
     * @param {Element} row
     * @returns monster name
     */
    // const getMonsterName = (row) => row.children[0].textContent;
    console.log("iterating over rows");
    // rows.forEach((row) => {
    //   // console.log(row.children[0].textContent);
    // });
  });
};

run();
