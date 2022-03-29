// export { };
const { remove_spaces, remove_newlines, clean_json_text } = require('../../src/utils/cleanjson');

test("remove_newlines removes newline character in a text", () => {
  expect(remove_newlines(`
  hel
  lo
  `)).toBe("  hel  lo  ");
});

test("remove_spaces trims whitespaces in a text", () => {
  expect(remove_spaces("    he  l l      o     ")).toBe("hello");
});

test("clean_json_text trims whitespaces and newlines from text", () => {
  expect(clean_json_text(`

    {

      "Hello":            "World",
      
      "abc"
    }

  `)).toBe(`{"Hello":"World","abc"}`);
});