type TurnstileResult = {
  success: boolean;
  'error-codes'?: string[];
};

export async function verifyTurnstile(token: string, secret: string, remoteIp?: string) {
  const formData = new FormData();
  formData.append('secret', secret);
  formData.append('response', token);
  if (remoteIp) formData.append('remoteip', remoteIp);

  const response = await fetch('https://challenges.cloudflare.com/turnstile/v0/siteverify', {
    method: 'POST',
    body: formData
  });

  if (!response.ok) return false;
  const result = (await response.json()) as TurnstileResult;
  return result.success;
}

