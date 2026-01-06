import { cn } from "@/lib/utils";
import { User, Sparkles } from "lucide-react";

interface ChatMessageProps {
  role: "user" | "assistant";
  content: string;
  isLoading?: boolean;
}

const ChatMessage = ({ role, content, isLoading }: ChatMessageProps) => {
  const isUser = role === "user";

  return (
    <div
      className={cn(
        "flex gap-4 px-4 py-6 transition-all duration-300",
        isUser ? "bg-transparent" : "bg-message-assistant"
      )}
    >
      <div
        className={cn(
          "flex h-8 w-8 shrink-0 items-center justify-center rounded-full",
          isUser
            ? "bg-secondary text-secondary-foreground"
            : "bg-primary/20 text-primary"
        )}
      >
        {isUser ? <User className="h-4 w-4" /> : <Sparkles className="h-4 w-4" />}
      </div>
      <div className="flex-1 space-y-2 overflow-hidden">
        <p className="text-sm font-medium text-muted-foreground">
          {isUser ? "You" : "Assistant"}
        </p>
        <div className="prose prose-invert max-w-none">
          {isLoading ? (
            <div className="flex items-center gap-1">
              <span className="h-2 w-2 animate-bounce rounded-full bg-primary [animation-delay:-0.3s]" />
              <span className="h-2 w-2 animate-bounce rounded-full bg-primary [animation-delay:-0.15s]" />
              <span className="h-2 w-2 animate-bounce rounded-full bg-primary" />
            </div>
          ) : (
            <p className="text-foreground leading-relaxed whitespace-pre-wrap">
              {content}
            </p>
          )}
        </div>
      </div>
    </div>
  );
};

export default ChatMessage;
