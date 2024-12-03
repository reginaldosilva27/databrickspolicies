## **1. Explicação dos Arquivos Terraform**

---

### **Estruturação em Módulos**
- Organização modular para facilitar a reutilização e o gerenciamento dos recursos.
- Cada módulo é projetado para lidar com uma funcionalidade específica.


---

## **2. Default Policies & Policies Families**

### **Policies Default**
- **Personal Compute**:
  - Disponível para todos os usuários.
  - **Single Node**: Uso individual e isolado.
- **Shared Compute**:
  - **Multi-node**.
  - Tipo: **All Purpose**.
  - Permite múltiplos usuários simultaneamente.
- **Power User Compute**:
  - Destinado a usuários avançados.
  - **DBR ML**: Projetado para workloads de Machine Learning.
- **Job Compute**:
  - Exclusivo para execução de jobs.

---

## **3. Utilização das Policies**
As policies foram criadas para atender diferentes perfis de uso e garantir conformidade com as regras da organização.

### **Tipos de Policies**
- **Fixed Policy**:
  - `Fixed`: Configuração fixa que não pode ser alterada.
  - `Forbidden`: Configuração explicitamente proibida.
- **Limiting Policy**:
  - `Allowlist`: Permite apenas valores ou configurações especificadas.
  - `Blocklist`: Bloqueia valores ou configurações específicas.
  - `Regex`: Validação por meio de expressões regulares.
  - `Range`: Define limites de valores permitidos.
  - `Unlimited`: Sem restrições, dentro das permissões gerais.

### **Permissões das Policies**
- **Enforce Policy Compliance**: Garante que as configurações respeitem as policies definidas.
- **Liberação de acessos**: É necessário liberar os usuarios e grupos para poderem usar a policy.

---

## **4. Adicionar Biblioteca a uma Policy**
- Podemos instalar Bibliotecas nas policies para propagar em todos os clusters

---
