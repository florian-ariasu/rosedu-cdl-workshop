import { pathsToModuleNameMapper } from  "ts-jest/utils";
const { compilerOptions } = require("./tsconfig");

export default {
  roots: ['<rootDir>/app', '<rootDir>/test/jest'],
  collectCoverage: true,
  coverageDirectory: 'coverage',
  coverageProvider: 'v8',
  transform: {
    '^.+\\.tsx?$': 'ts-jest',
  },
  moduleNameMapper: pathsToModuleNameMapper(compilerOptions.paths, { prefix: '<rootDir>/' } ),

  testPathIgnorePatterns: [
    '/node_modules/',
    '/dist/', // Ignore the output directory
    '/build/', // Ignore any build directory if used
    '\\.js$', // Ignore .js test files if they are in the same directories as .ts tests
  ],

  // Optionally specify testMatch to explicitly look for only TypeScript files
  testMatch: ["**/?(*.)+(spec|test).ts?(x)"], // Only `.ts` and `.tsx` files
};
