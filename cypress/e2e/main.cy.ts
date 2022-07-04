describe("empty spec", () => {
  it("passes", () => {
    cy.intercept("https://example.com", {
      statusCode: 200,
      body: "Yo!",
    });

    cy.visit("output/index.html");
  });
});
