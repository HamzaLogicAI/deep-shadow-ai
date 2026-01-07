# Deep Shadow AI - A Smart Assistant

A modern web application built with React, TypeScript, and Tailwind CSS.

## 🚀 Features

- Modern React 18 with TypeScript
- Responsive design with Tailwind CSS
- Component library with shadcn-ui
- Fast development with Vite
- Type-safe development environment

## 🛠️ Technology Stack

- **Frontend Framework:** React 18
- **Language:** TypeScript
- **Styling:** Tailwind CSS
- **UI Components:** shadcn-ui
- **Build Tool:** Vite
- **Package Manager:** npm

## 📦 Installation

### Prerequisites

- Node.js (v18 or higher)
- npm or yarn

### Setup

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd <project-directory>
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Start development server**
   ```bash
   npm run dev
   ```

4. **Open your browser**
   
   Navigate to `http://localhost:5173` to view the application.

## 🏗️ Development

### Available Scripts

- `npm run dev` - Start development server with hot reload
- `npm run build` - Build for production
- `npm run preview` - Preview production build locally
- `npm run lint` - Run ESLint for code quality
- `npm run type-check` - Run TypeScript type checking

### Project Structure

```
├── src/
│   ├── components/     # Reusable UI components
│   ├── pages/         # Application pages
│   ├── hooks/         # Custom React hooks
│   ├── utils/         # Utility functions
│   ├── types/         # TypeScript type definitions
│   └── styles/        # Global styles
├── public/            # Static assets
└── ...config files
```

## 🚀 Deployment

### Build for Production

```bash
npm run build
```

This creates an optimized production build in the `dist/` directory.

### Deployment Options

The application can be deployed to any static hosting service:

- **Vercel:** Connect your GitHub repository for automatic deployments
- **Netlify:** Drag and drop the `dist/` folder or connect via Git
- **GitHub Pages:** Use GitHub Actions for automated deployment
- **AWS S3 + CloudFront:** Upload the build files to S3 and configure CloudFront

### Environment Variables

Create a `.env` file in the root directory for environment-specific configuration:

```env
VITE_API_URL=your_api_url
VITE_APP_TITLE=Your App Title
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 Code Style

This project uses:
- ESLint for code linting
- Prettier for code formatting
- TypeScript for type safety

Run `npm run lint` to check for linting errors.

## 🐛 Troubleshooting

### Common Issues

**Port already in use:**
```bash
# Kill process using port 5173
lsof -ti:5173 | xargs kill -9
```

**Node modules issues:**
```bash
# Clear cache and reinstall
rm -rf node_modules package-lock.json
npm install
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Support

For support, please open an issue in the GitHub repository or contact the development team.

---

Built with ❤️ using modern web technologies.