## How To Guides

### Basic Typescript Webpack React
[Base Documentation](https://www.typescriptlang.org/docs/handbook/react-&-webpack.html) - This document assumes you're using base npm.

Let's use [yarn](https://yarnpkg.com/) as our package manager.
### Repository Setup
```
proj/
├─ dist/
└─ src/
   └─ components/
```

Run `git init` in the root of the repository
Run `touch .gitignore` to create a git ignore file and update it with the following values:

```
dist
node_modules
```

### Package Setup

Run `yarn init` to establish a package.json at the root of our application.

1. `yarn add webpack webpack-cli --dev`
2. `yarn add react react-dom`
3. `yarn add @types/react @types/react-dom --dev`
4. `yarn add typescript ts-loader source-map-loader --dev`

### Configuration

#### Typescript
Create a `tsconfig.json` by running `touch tsconfig.json` and then use the following base configuration.

```
{
    "compilerOptions": {
        "outDir": "./dist/",
        "sourceMap": true,
        "noImplicitAny": true,
        "module": "commonjs",
        "target": "es6",
        "jsx": "react"
    }
}
```

#### Webpack
Create a `webpack.config.js` by running `touch webpack.config.js` and then use the following base configuration.

```
module.exports = {
    mode: "production",

    // Enable sourcemaps for debugging webpack's output.
    devtool: "source-map",

    resolve: {
        // Add '.ts' and '.tsx' as resolvable extensions.
        extensions: [".ts", ".tsx"]
    },

    module: {
        rules: [
            {
                test: /\.ts(x?)$/,
                exclude: /node_modules/,
                use: [
                    {
                        loader: "ts-loader"
                    }
                ]
            },
            // All output '.js' files will have any sourcemaps re-processed by 'source-map-loader'.
            {
                enforce: "pre",
                test: /\.js$/,
                loader: "source-map-loader"
            }
        ]
    },

    // When importing a module whose path matches one of the following, just
    // assume a corresponding global variable exists and use that instead.
    // This is important because it allows us to avoid bundling all of our
    // dependencies, which allows browsers to cache those libraries between builds.
    externals: {
        "react": "React",
        "react-dom": "ReactDOM"
    }
};
```

Run `npx webpack` and open the `index.html` to see that the configuration worked!

* * *

## Intermediate Setup

### Webpack Dev Server

Webpack dev server allows you to run your application in a local web development environment.

`yarn add webpack-dev-server --dev`

Add a script to your package.json to allow for the server to run:
```
//...
"scripts": {
    "start:dev": "webpack-dev-server",
    "watch": "webpack --watch --hot"
}
//...
```

Update entry value webpack.config.json to have the following properties
```
module.exports = {
    //...
    resolve: {
        // Add '.ts' and '.tsx' as resolvable extensions.
        extensions: [".ts", ".tsx", ".js"]
    },
    entry: './src/index.tsx',
    devServer: {
        compress: true,
        port: 9000,
    },
    //...
}
```

To confirm that it's working. Open two terminals and run the following commands. This will launch the file watcher and the local development server

Terminal 1: `yarn watch`
Terminal 2: `yarn start:dev`

Confirm that your application launches at [localhost:9000](http://localhost:9000)

### Eslint

### Babel

* * *

## Advanced Setup

### Docker Container

### Debugging Source Maps
