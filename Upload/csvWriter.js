import axios from 'axios';
import writer from 'csv-write-stream';
import fs from 'fs';

const csvStream = writer();
csvStream.pipe(fs.createWriteStream('Upload/productImage.csv'));

const getImages = async () => {
  for (let i = 1; i <= 14; i++) {
    const data = await axios.get('https://api.unsplash.com/search/photos', {
      params: {
        client_id: process.env.SECRET_KEY,
        query: 'person',
        per_page: 3,
        page: i,
      },
    });
    const db = data.data.results;
    let count = 1;
    let productId = i;
    db.forEach((v) => {
      count += 1;
      const imageUrl = v.urls.small;
      if (count === 3) {
        count = 1;
        productId += 1;
      }
      csvStream.write({ productId, imageUrl });
    });
  }

  csvStream.end();
};

// getImages();
