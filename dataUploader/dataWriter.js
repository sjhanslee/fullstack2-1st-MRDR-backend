import fs from 'fs';
import axios from 'axios';
import writer from 'csv-write-stream';

const files = ['test'];
const colors = [
  'black',
  'white',
  'yellow',
  'orange',
  'red',
  'purple',
  'magenta',
  'green',
  'teal',
  'blue',
];

const getPics = {
  color: async () => {
    const csvWriter = writer();
    csvWriter.pipe(fs.createWriteStream(`dataUploader/color.csv`));
    for (let color of colors) {
      csvWriter.write({ name: color, haxCode: '1' });
    }
    csvWriter.end();
  },

  getProductPics: async () => {
    const url = 'https://api.unsplash.com/search/photos';

    const csvWriter = writer();
    csvWriter.pipe(fs.createWriteStream(`dataUploader/productColorImage.csv`));
    for (let color of colors) {
      const data = await axios.get(url, {
        params: {
          client_id: process.env.SECRET_KEY,
          query: 'fashion',
          per_page: 10,
          page: 1,
          color: `${color}`,
        },
      });

      for (let item of data.data.results) {
        const image_url = item.urls.small;
        const color_id = colors.indexOf(color) + 1;
        const product_id = 1;
        csvWriter.write({ image_url, color_id, product_id });
      }
    }
    csvWriter.end();
  },
  getProductDetailPics: async () => {
    const url = 'https://api.unsplash.com/search/photos';

    const csvWriter = writer();
    csvWriter.pipe(
      fs.createWriteStream(`dataUploader/productColorDetailImage.csv`)
    );
    for (let color of colors) {
      const data = await axios.get(url, {
        params: {
          client_id: process.env.SECRET_KEY,
          query: 'fashion',
          per_page: 10,
          page: 2,
          color: `${color}`,
        },
      });

      for (let item of data.data.results) {
        const image_url = item.urls.small;
        const color_id = colors.indexOf(color) + 1;
        const product_id = 1;
        csvWriter.write({ image_url, color_id, product_id });
      }
    }
    csvWriter.end();
  },
};

for (let file of files) {
  try {
    // getPics.color();
    // getPics.getProductPics();
    // getPics.getProductDetailPics();
  } catch (e) {
    console.log(e);
  }
}
