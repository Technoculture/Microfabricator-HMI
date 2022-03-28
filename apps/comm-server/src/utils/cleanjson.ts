export {}; // declare a module

const clean_json_text = (json_text: string) => {
  return json_text.replace(/\s/g, "").replace(/(\r\n|\n|\r)/gm, "");
};

module.exports = {
  clean_json_text,
};
