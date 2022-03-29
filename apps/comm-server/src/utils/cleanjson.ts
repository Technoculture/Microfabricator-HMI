export {}; // declare a module

const remove_spaces = (text: string): string => text.replace(/\s/g, "");
const remove_newlines = (text: string): string =>
  text.replace(/(\r\n|\n|\r)/gm, "");

const clean_json_text = (json_text: string): string => {
  return remove_newlines(remove_spaces(json_text));
};

module.exports = {
  remove_spaces,
  remove_newlines,
  clean_json_text,
};
